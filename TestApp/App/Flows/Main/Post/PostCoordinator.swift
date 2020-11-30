//
//  PostCoordinator.swift
//  TestApp
//
//  Created by Yurii Bosov on 30.11.2020.
//

import UIKit

class PostCoordinator: BaseCoordinator {
    
    override func start(with option: [String : AnyObject]? = nil) {
        let viewModel = PostListViewModel()
        let controller = PostListViewController()
        controller.viewModel = viewModel
        self.router.setRootModule(controller)
    }
}
