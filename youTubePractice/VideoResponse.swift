//
//  Response.swift
//  youTubePractice
//
//  Created by Chandu Reddy on 29/07/20.
//  Copyright © 2020 Chandu Reddy. All rights reserved.
//

import Foundation

struct VideoResponse: Decodable {
    
    var videoItems: [VideosDetails]?
    
    enum codingKeys: String, CodingKey {
        case videoItems = "items"
    }
    
    init(from decoders: Decoder) throws {
        let container = try decoders.container(keyedBy: codingKeys.self)
        
        self.videoItems = try container.decode([VideosDetails].self, forKey: .videoItems)
    }
}
