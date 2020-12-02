//
//  Router.swift
//  TestApp
//
//  Created by Yurii Bosov on 28.11.2020.
//

import UIKit

final class Router: NSObject {
    
    private var rootController: UINavigationController
    
    init(rootController: UINavigationController) {
        self.rootController = rootController
    }
    
    //MARK: - Push|Pop
    func push(_ module: Presentable?, animated: Bool) {
        guard let controller = module?.toPresent() else { return }
        rootController.pushViewController(controller, animated: animated)
    }
    
    func pop(animated: Bool) {
        rootController.popViewController(animated: animated)
    }

    //MARK: - Present|Dismiss
    func present(_ module: Presentable?, animated: Bool, completion: (() -> Void)?) {
        guard let controller = module?.toPresent() else { return }
        let root = rootController.presentedViewController ?? rootController
        root.present(controller, animated: animated, completion: completion)
    }
    
    func dismiss(animated: Bool, completion: (() -> Void)?) {
        let root = rootController.presentedViewController ?? rootController
        root.dismiss(animated: animated, completion: completion)
    }
    
    //MARK: - Set Root
    func setRootModule(_ module: Presentable?, hideBar: Bool = false) {
        guard let controller = module?.toPresent() else { return }
        rootController.setViewControllers([controller], animated: false)
        rootController.isNavigationBarHidden = hideBar
    }
}

extension Router: Presentable {
    func toPresent() -> UIViewController {
        return rootController
    }
}
