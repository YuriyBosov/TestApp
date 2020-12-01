//
//  PostDetailedViewController.swift
//  TestApp
//
//  Created by Yurii Bosov on 30.11.2020.
//

import UIKit

class PostDetailedViewController: ViewController {
    
    var viewModel: PostDetailedViewModel?
    
    @IBOutlet private var postTitle: UILabel?
    
    override func setup() {
        super.setup()
        title = "Post Detailed"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViewModel()
    }
    
    private func setupViewModel() {
        postTitle?.text = viewModel?.post.title
    }
}
