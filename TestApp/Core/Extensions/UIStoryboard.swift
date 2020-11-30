//
//  UIStoryboard.swift
//  TestApp
//
//  Created by Yurii Bosov on 30.11.2020.
//

import UIKit

extension UIStoryboard {
    func instantiateViewController<T: UIViewController>(withIdentifier: String) -> T? {
        return self.instantiateViewController(withIdentifier: withIdentifier) as? T
    }
}
