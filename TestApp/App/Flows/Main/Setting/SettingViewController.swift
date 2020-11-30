//
//  SettingViewController.swift
//  TestApp
//
//  Created by Yurii Bosov on 30.11.2020.
//

import UIKit

class SettingViewController: ViewController {
    
    var viewModel: SettingViewModel?
    
    override func setup() {
        super.setup()
        self.title = "Settings"
        self.tabBarItem = UITabBarItem(title: "Settings", image: UIImage(named: "tabSetting"), tag: 0)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(logoutButtonTapped))
    }
    
    @objc private func logoutButtonTapped() {
        viewModel?.logout()
    }
}
