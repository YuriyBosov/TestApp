//
//  MainCoordinator.swift
//  TestApp
//
//  Created by Yurii Bosov on 30.11.2020.
//

import UIKit

class MainCoordinator: BaseCoordinator {
    
    override func start(with option: [String : AnyObject]? = nil) {
        
        // post tab
        let postCoordinator = PostCoordinator(session: session,
                                              router: Router(rootController: NavigationController()))
        self.addDependency(postCoordinator)
        postCoordinator.start()
        
        // users tab
        let usersCoordinator = UsersCoordinator(session: session,
                                                router: Router(rootController: NavigationController()))
        self.addDependency(usersCoordinator)
        usersCoordinator.start()
        
        // messages tap
        let messagesCoordinator = MessagesCoordinator(session: session,
                                                      router: Router(rootController: NavigationController()))
        self.addDependency(messagesCoordinator)
        messagesCoordinator.start()
        
        // settings tap
        let settingCoordinator = SettingCoordinator(session: session,
                                                    router: Router(rootController: NavigationController()))
        settingCoordinator.onLogoutUser = { [weak self] in
            self?.session.logoutUser()
            self?.onFinishFlow?(self)
        }
        self.addDependency(settingCoordinator)
        settingCoordinator.start()
        
        let tabBarController = MainTabBarController()
        tabBarController.viewControllers = [
            postCoordinator.router.toPresent(),
            usersCoordinator.router.toPresent(),
            messagesCoordinator.router.toPresent(),
            settingCoordinator.router.toPresent()
        ]
        
        router.setRootModule(tabBarController, hideBar: true)
    }
}
