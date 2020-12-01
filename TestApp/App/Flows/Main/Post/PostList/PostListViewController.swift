//
//  PostListViewController.swift
//  TestApp
//
//  Created by Yurii Bosov on 30.11.2020.
//

import UIKit

class PostListViewController: ViewController {
    
    @IBOutlet private var tableView: UITableView?
    @IBOutlet private var segmentedControl: UISegmentedControl?
    
    var viewModel: PostListViewModel? {
        didSet {
            viewModel?.onLoadStart = { [weak self] in
                self?.view.showActivity()
            }
            viewModel?.onLoadEnd = { [weak self] error in
                self?.tableView?.refreshControl?.endRefreshing()
                if let message = error?.message {
                    print(message)
                    self?.view.showError(text: message)
                } else {
                    self?.view.hideActivity()
                }
            }
            viewModel?.onFetchCompletion = { [weak self] response in
                self?.tableView?.reloadData()
            }
        }
    }
    
    override func setup() {
        super.setup()
        self.title = "Top Posts"
        self.tabBarItem = UITabBarItem(title: "Posts", image: UIImage(named: "tabList"), tag: 0)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView?.refreshControl = UIRefreshControl()
        tableView?.refreshControl?.addTarget(self, action: #selector(refreshing), for: .valueChanged)
        tableView?.backgroundColor = Constant.Color.defaultBackgroundColor
        
        tableView?.register(UINib(nibName: PostCell.className, bundle: nil),
                            forCellReuseIdentifier: PostCell.className)
        tableView?.register(UINib(nibName: LoadMoreCell.className, bundle: nil),
                            forCellReuseIdentifier: LoadMoreCell.className)
        
        viewModel?.fetchData()
    }
    
    //MARK: - Private
    private func fetchCompletion() {
        tableView?.reloadData()
    }
    
    //MARK: - Actions
    @objc private func refreshing() {
        viewModel?.fetchData(force: true)
    }
    
    @IBAction private func periodValueChanged(sender: UISegmentedControl) {
        let period: Post.PeriodType
        switch sender.selectedSegmentIndex {
        case 1:
            period = .week
        case 2:
            period = .month
        case 3:
            period = .year
        case 4:
            period = .all
        default:
            period = .day
        }
        viewModel?.periodType = period
    }
}

//MARK: - UITableViewDataSource
extension PostListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let viewModel = viewModel else {
            return 0
        }
        return viewModel.canLoadMore() ? viewModel.items.count + 1 : viewModel.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: UITableViewCell
        
        if let viewModel = viewModel, indexPath.row < viewModel.items.count {
            cell = tableView.dequeueReusableCell(withIdentifier: PostCell.className, for: indexPath)
            if let cell = cell as? PostCell {
                viewModel.items[indexPath.row].setupCell(cell)
            }
        } else {
            cell = tableView.dequeueReusableCell(withIdentifier: LoadMoreCell.className, for: indexPath)
            if let cell = cell as? LoadMoreCell {
                cell.activityIndicator?.startAnimating()
            }
        }
        
        return cell
    }
}

//MARK: - UITableViewDelegate
extension PostListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if let viewModel = viewModel, indexPath.row < viewModel.items.count {
            viewModel.items[indexPath.row].didSelectPost()
        }
        
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if cell is LoadMoreCell {
            viewModel?.loadMoreData()
        }
    }
}
