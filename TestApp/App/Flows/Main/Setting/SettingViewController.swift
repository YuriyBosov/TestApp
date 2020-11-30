//
//  SettingViewController.swift
//  TestApp
//
//  Created by Yurii Bosov on 30.11.2020.
//

import UIKit

class SettingViewController: ViewController {
    
    var viewModel: SettingViewModel?
    
    private var imageView = UIImageView()
    
    override func setup() {
        super.setup()
        self.title = "Settings"
        self.tabBarItem = UITabBarItem(title: "Settings", image: UIImage(named: "tabSetting"), tag: 0)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(logoutButtonTapped))
        
        // test image loader
        self.view.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        NSLayoutConstraint .activate([
            imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            imageView.widthAnchor.constraint(equalToConstant: self.view.frame.width/2),
            imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor, multiplier: 1, constant: 0)
        ])
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // test image loader
        imageView.image("https://i0.wp.com/digiday.com/wp-content/uploads/2013/04/reddit1.jpg",
                        thumbnail: UIImage(named: "placeholder"))
    }
    
    @objc private func logoutButtonTapped() {
        viewModel?.logout()
    }
}
