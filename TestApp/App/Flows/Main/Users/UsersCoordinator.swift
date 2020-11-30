//
//  UsersCoordinator.swift
//  TestApp
//
//  Created by Yurii Bosov on 30.11.2020.
//

import UIKit

class UsersCoordinator: BaseCoordinator {
    
    override func start(with option: [String : AnyObject]? = nil) {
        let viewModel = UsersViewModel()
        let controller = UsersViewController()
        controller.viewModel = viewModel
        self.router.setRootModule(controller)
    }
}

