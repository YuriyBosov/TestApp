//
//  MessagesViewController.swift
//  TestApp
//
//  Created by Yurii Bosov on 30.11.2020.
//

import UIKit

class MessagesViewController: ViewController {
    
    var viewModel: MessagesViewModel?
    
    override func setup() {
        super.setup()
        self.title = "List of Messages"
        self.tabBarItem = UITabBarItem(title: "Messages", image: UIImage(named: "tabMessages"), tag: 0)
    }
}
