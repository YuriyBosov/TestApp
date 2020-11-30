//
//  UsersViewController.swift
//  TestApp
//
//  Created by Yurii Bosov on 30.11.2020.
//

import UIKit

class UsersViewController: ViewController {
    
    var viewModel: UsersViewModel?
    
    override func setup() {
        super.setup()
        self.title = "Users List"
        self.tabBarItem = UITabBarItem(title: "Users", image: UIImage(named: "tabUsers"), tag: 0)
    }
}
