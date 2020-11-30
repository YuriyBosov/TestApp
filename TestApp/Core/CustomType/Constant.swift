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
        typealias complition = () -> Void
        typealias result = (Bool) -> Void
        
        typealias loadStart = () -> Void
        typealias loadEnd = (ErrorHandler?) -> Void
        typealias loadComplition = (Any) -> Void
    }
    
    enum Color {
        static let defaultBackgroundColor = UIColor(red: 235.0/255.0,
                                                    green: 235.0/255.0,
                                                    blue: 235.0/255.0,
                                                    alpha: 1)
    }
}
