//
//  Coordinator.swift
//  TestApp
//
//  Created by Yurii Bosov on 28.11.2020.
//

import Foundation

typealias CompletionBlock = (Coordinator?) -> ()

class Coordinator: NSObject {
    
    let router: Router
    var onFinishFlow: CompletionBlock?
    
    private var childrenCoordinators: [Coordinator] = []
    
    //MARK: - Init|Deinit Dependency
    init(router: Router) {
        self.router = router
        super.init()
    }
    
    deinit {
        #if DEBUG
        print("deinit \(self.className)")
        #endif
    }
    
    //MARK: - Add|Remove Dependency
    func addDependency(_ coordinator: Coordinator) {
        for element in childrenCoordinators where element === coordinator {
            return
        }
        childrenCoordinators.append(coordinator)
    }
    
    func removeDependency(_ coordinator: Coordinator?) {
        guard !childrenCoordinators.isEmpty, let coordinator = coordinator else { return }
        
        for (index, element) in childrenCoordinators.reversed().enumerated() where element === coordinator {
            childrenCoordinators.remove(at: index)
            break
        }
    }
    
    //MARK: - Start
    func start(with option: [String: AnyObject]? = nil) {
        
    }
}
