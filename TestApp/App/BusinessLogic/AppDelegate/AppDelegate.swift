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
        
//        // test request
//        Network.request(path: Network.Path.topPost, parameters: ["limit":3])
        
        return true
    }
    
    // TODO 
//    func application(_ application: UIApplication, shouldSaveSecureApplicationState coder: NSCoder) -> Bool {
//        return true
//    }
//
//    func application(_ application: UIApplication, shouldRestoreSecureApplicationState coder: NSCoder) -> Bool {
//        return true
//    }

}

