//
//  UIViewController.swift
//  TestApp
//
//  Created by Yurii Bosov on 30.11.2020.
//

import UIKit

extension UIViewController {
    
    class func instantiateFromStoryboard(storyboardName: String, storyboardId: String? = nil) -> Self? {
        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
        return storyboard.instantiateViewController(withIdentifier: storyboardId ?? self.className)
    }
}
