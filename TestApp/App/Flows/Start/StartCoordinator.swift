//
//  StartCoordinator.swift
//  TestApp
//
//  Created by Yurii Bosov on 30.11.2020.
//

import UIKit

class StartCoordinator: BaseCoordinator {
    
    override func start(with option: [String : AnyObject]? = nil) {
        let viewModel = StartViewModel()
        viewModel.onFetchComplition = {[weak self] _ in
            self?.onFinishFlow?(self)
        }
        
        let controller = StartViewController.instantiateFromStoryboard(storyboardName: "Start")
        controller?.viewModel = viewModel
        
        router.setRootModule(controller, hideBar: true)
    }
}
