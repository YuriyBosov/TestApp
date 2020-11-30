//
//  PostListViewController.swift
//  TestApp
//
//  Created by Yurii Bosov on 30.11.2020.
//

import UIKit

class PostListViewController: ViewController {
    
    var viewModel: PostListViewModel?
    
    override func setup() {
        super.setup()
        self.title = "Top Posts"
        self.tabBarItem = UITabBarItem(title: "Posts", image: UIImage(named: "tabList"), tag: 0)
    }
}
