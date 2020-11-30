//
//  UIView.swift
//  TestApp
//
//  Created by Yurii Bosov on 30.11.2020.
//

import UIKit

extension UIView {
    
    //MARK: - HUD
    func showActivity(_ text: String? = nil) {
        HUDView.showInView(view: self, text: text)
    }
    
    func showError(text: String) {
        HUDView.showErrorInView(view: self, text: text)
    }
    
    func hideActivity() {
        HUDView.removeFromView(view: self)
    }
}
