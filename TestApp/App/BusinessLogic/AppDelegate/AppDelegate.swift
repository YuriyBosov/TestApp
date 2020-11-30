//
//  AppDelegate.swift
//  TestApp
//
//  Created by Yurii Bosov on 28.11.2020.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    lazy var window: UIWindow? = UIWindow(frame: UIScreen.main.bounds)
    
    var appCoordinator: AppCoordinator?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let session = Session.current
        let router = Router(rootController: NavigationController())
        appCoordinator = AppCoordinator(session: session, router: router)
        
        window?.rootViewController = appCoordinator?.router.toPresent()
        window?.makeKeyAndVisible()
        
        appCoordinator?.start()
        
        return true
    }

}

