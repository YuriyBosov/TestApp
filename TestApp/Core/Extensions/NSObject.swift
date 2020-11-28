//
//  NSObject.swift
//  TestApp
//
//  Created by Yurii Bosov on 28.11.2020.
//

import Foundation

extension NSObject {
    var className: String {
        return NSStringFromClass(type(of: self))
    }
}
