//
//  Post.swift
//  TestApp
//
//  Created by Yurii Bosov on 28.11.2020.
//

import Foundation

struct Post: Decodable {
    
    enum PeriodType: String {
        case day, week, month, year, all
    }
    
    enum CodingKeys: String, CodingKey {
        case data = "data"
    }
    
    enum DataCodingKeys: String, CodingKey {
        case title
        case author
        case created = "created_utc"
        case score
        case numComments = "num_comments"
    }
    
    let title: String
    let author: String
    let created: Date
    let score: Int
    let numComments: Int
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let dataContainer = try container.nestedContainer(keyedBy: DataCodingKeys.self, forKey: .data)
        
        self.title = try dataContainer.decode(String.self, forKey: .title)
        self.author = try dataContainer.decode(String.self, forKey: .author)
        self.score = try dataContainer.decode(Int.self, forKey: .score)
        self.numComments = try dataContainer.decode(Int.self, forKey: .numComments)
        
        let timestamp = try dataContainer.decode(Double.self, forKey: .created)
        self.created = Date(timeIntervalSince1970: timestamp)
    }
}
