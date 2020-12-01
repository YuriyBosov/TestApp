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
        self.interactivePopGestureRecognizer?.delegate = self
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return topViewController?.supportedInterfaceOrientations ?? .all
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return topViewController?.preferredStatusBarStyle ?? .default
    }
}

extension NavigationController: UIGestureRecognizerDelegate {
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        if gestureRecognizer == interactivePopGestureRecognizer &&
            self.viewControllers.count == 1 {
            return false
        } else {
            return true
        }
    }
}

