//
//  Constant.swift
//  TestApp
//
//  Created by Yurii Bosov on 30.11.2020.
//

import UIKit

enum Constant {
    enum Block {
        typealias json = ([String : Any]) -> Void
        typealias data = (Data) -> Void
        typealias error = (ErrorHandler) -> Void
        typealias completion = () -> Void
        typealias result = (Bool) -> Void
        
        typealias loadStart = () -> Void
        typealias loadEnd = (ErrorHandler?) -> Void
        typealias loadCompletion = (Any) -> Void
    }
    
    enum Color {
        static let defaultBackgroundColor = UIColor(red: 245.0/255.0,
                                                    green: 245.0/255.0,
                                                    blue: 245.0/255.0,
                                                    alpha: 1)
    }
}
