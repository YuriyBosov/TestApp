//
//  Network+Config.swift
//  TestApp
//
//  Created by Yurii Bosov on 01.12.2020.
//

import Foundation

extension Network {
    enum Setting {
        static let baseURL = "https://www.reddit.com"
    }
    
    enum Header {
        static let JSON = ["Content-Type" : "application/json", "Accept" : "application/json"]
    }
    
    enum Method: String {
        case get = "GET"
        case post = "POST"
    }
}
