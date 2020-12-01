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
        case preview
        case url
        case media
    }
    
    enum PreviewCodingKeys: String, CodingKey {
        case images
    }
    
    enum VideoCodingKeys: String, CodingKey {
        case video = "reddit_video"
    }
    
    let title: String
    let author: String
    let created: Date
    let score: Int
    let numComments: Int
    let url: String?
    
    let preview: [Preview]?
    let video: Video?
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        let dataContainer = try container.nestedContainer(keyedBy: DataCodingKeys.self, forKey: .data)
        let previewContainer = try? dataContainer.nestedContainer(keyedBy: PreviewCodingKeys.self, forKey: .preview)
        let videoContainer = try? dataContainer.nestedContainer(keyedBy: VideoCodingKeys.self, forKey: .media)
        
        self.title = try dataContainer.decode(String.self, forKey: .title)
        self.author = try dataContainer.decode(String.self, forKey: .author)
        self.score = try dataContainer.decode(Int.self, forKey: .score)
        self.numComments = try dataContainer.decode(Int.self, forKey: .numComments)
        self.url = try? dataContainer.decode(String.self, forKey: .url)
        
        let timestamp = try dataContainer.decode(Double.self, forKey: .created)
        self.created = Date(timeIntervalSince1970: timestamp)
        
        self.preview = try? previewContainer?.decode([Preview].self, forKey: .images)
        self.video = try? videoContainer?.decode(Video.self, forKey: .video)
    }
}
