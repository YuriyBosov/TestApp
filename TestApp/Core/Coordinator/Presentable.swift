//
//  Presentable.swift
//  TestApp
//
//  Created by Yurii Bosov on 28.11.2020.
//

import UIKit
import AVKit

protocol Presentable: class {
    func toPresent() -> UIViewController
}

//MARK: - Extension for UIKit
extension ViewController: Presentable {
    func toPresent() -> UIViewController {
        return self
    }
}

extension NavigationController: Presentable {
    func toPresent() -> UIViewController {
        return self
    }
}

extension UITabBarController: Presentable {
    func toPresent() -> UIViewController {
        return self
    }
}

extension UIAlertController: Presentable {
    func toPresent() -> UIViewController {
        return self
    }
}

extension UIActivityViewController: Presentable {
    func toPresent() -> UIViewController {
        return self
    }
}

extension AVPlayerViewController: Presentable {
    func toPresent() -> UIViewController {
        return self
    }
}
