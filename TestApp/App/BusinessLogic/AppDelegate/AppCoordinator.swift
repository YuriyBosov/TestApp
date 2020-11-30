//
//  AppCoordinator.swift
//  TestApp
//
//  Created by Yurii Bosov on 28.11.2020.
//

import Foundation

class AppCoordinator: BaseCoordinator {
    
    override func start(with option: [String : AnyObject]? = nil) {
        runStartFlow()
    }
    
    private func runStartFlow() {
        let startCoordinator = StartCoordinator(session: self.session, router: self.router)
        startCoordinator.onFinishFlow = { [weak self] coordinator in
            self?.removeDependency(coordinator)
            if self?.session.isUserLogin == true {
                self?.runMainFlow()
            } else {
                self?.runAuthFlow()
            }
        }
        self.addDependency(startCoordinator)
        startCoordinator.start()
    }
    
    private func runAuthFlow() {
        let mainCoordinator = AuthCoordinator(session: self.session, router: self.router)
        mainCoordinator.onFinishFlow = { [weak self] coordinator in
            self?.removeDependency(coordinator)
            self?.runMainFlow()
        }
        self.addDependency(mainCoordinator)
        mainCoordinator.start()
    }
    
    private func runMainFlow() {
        let mainCoordinator = MainCoordinator(session: self.session, router: self.router)
        mainCoordinator.onFinishFlow = { [weak self] coordinator in
            self?.removeDependency(coordinator)
            self?.runAuthFlow()
        }
        self.addDependency(mainCoordinator)
        mainCoordinator.start()
    }
    
}
