//
//  PreviewData.swift
//  TestApp
//
//  Created by Yurii Bosov on 01.12.2020.
//

import Foundation

struct Preview: Decodable {
    let source: Image
    let resolutions: [Image]
}
