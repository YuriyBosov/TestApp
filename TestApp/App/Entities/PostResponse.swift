//
//  PostResponse.swift
//  TestApp
//
//  Created by Yurii Bosov on 28.11.2020.
//

import Foundation

struct PostResponse: Decodable {
    
    enum CodingKeys: String, CodingKey {
        case data = "data"
    }
    
    enum DataCodingKeys: String, CodingKey {
        case after = "after"
        case before = "before"
        case posts = "children"
    }
    
    let posts: [Post]
    let after: String?
    let before: String?
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let dataContainer = try container.nestedContainer(keyedBy: DataCodingKeys.self, forKey: .data)
        
        self.posts = try dataContainer.decode([Post].self, forKey: .posts)
        self.after = try? dataContainer.decode(String.self, forKey: .after)
        self.before = try? dataContainer.decode(String.self, forKey: .before)
    }
}
