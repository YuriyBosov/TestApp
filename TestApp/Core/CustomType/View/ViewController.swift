//
//  ViewController.swift
//  TestApp
//
//  Created by Yurii Bosov on 28.11.2020.
//

import UIKit

class ViewController: UIViewController {

    deinit {
        #if DEBUG
        print("deinit \(self.className)")
        #endif
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .all
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .default
    }
}

