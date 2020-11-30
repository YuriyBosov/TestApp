//
//  NavigationController.swift
//  TestApp
//
//  Created by Yurii Bosov on 28.11.2020.
//

import UIKit

class NavigationController: UINavigationController {

    deinit {
        #if DEBUG
        print("deinit \(self.className)")
        #endif
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemYellow
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return topViewController?.supportedInterfaceOrientations ?? .all
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return topViewController?.preferredStatusBarStyle ?? .default
    }
}
