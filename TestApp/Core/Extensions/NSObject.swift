//
//  NSObject.swift
//  TestApp
//
//  Created by Yurii Bosov on 28.11.2020.
//

import Foundation

extension NSObject {
    class var className: String {
        return String(describing: self)
    }
    
    var className: String {
        return type(of: self).className
    }
}
