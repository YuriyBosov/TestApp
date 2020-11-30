//
//  MessagesCoordinator.swift
//  TestApp
//
//  Created by Yurii Bosov on 30.11.2020.
//

import UIKit

class MessagesCoordinator: BaseCoordinator {
    
    override func start(with option: [String : AnyObject]? = nil) {
        let viewModel = MessagesViewModel()
        let controller = MessagesViewController()
        controller.viewModel = viewModel
        self.router.setRootModule(controller)
    }
}
