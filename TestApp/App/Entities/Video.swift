//
//  Media.swift
//  TestApp
//
//  Created by Yurii Bosov on 01.12.2020.
//

import Foundation

struct Video: Decodable {
    
    enum CodingKeys: String, CodingKey {
        case fallbackUrl = "fallback_url"
        case height
        case width
    }
    
    let fallbackUrl: String
    let height: Double
    let width: Double
}
