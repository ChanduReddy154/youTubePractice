//
//  VideosDetails.swift
//  youTubePractice
//
//  Created by Chandu Reddy on 29/07/20.
//  Copyright © 2020 Chandu Reddy. All rights reserved.
//

import Foundation

struct VideosDetails: Decodable {
    var videoId = ""
    var videoTitle = ""
    var videoDescription = ""
    var videoThumbnail = ""
    var published = Date()
    
    enum Keys: String, CodingKey {
        
        case snippet
        case high
        case thumbnails
        case resourceId
        
        case published = "publishedAt"
        case videoTitle = "title"
        case videoDescription = "description"
        case videoThumbnail = "url"
        case videoId
        
    }
    
    init(from decoders: Decoder) throws {
        let container = try decoders.container(keyedBy: Keys.self)
        
        let snippetContainer = try container.nestedContainer(keyedBy: Keys.self, forKey: .snippet)
        
        self.videoTitle =  try snippetContainer.decode(String.self, forKey: .videoTitle)
        
        self.videoDescription = try snippetContainer.decode(String.self, forKey: .videoDescription)
        
        self.published = try snippetContainer.decode(Date.self, forKey: .published)
        
        let thumbnailContainer = try snippetContainer.nestedContainer(keyedBy: Keys.self, forKey: .thumbnails)
        
        let highContainer = try thumbnailContainer.nestedContainer(keyedBy: Keys.self, forKey: .high)
        
        self.videoThumbnail = try highContainer.decode(String.self, forKey: .videoThumbnail)
        
        let videoResourceContainer = try snippetContainer.nestedContainer(keyedBy: Keys.self, forKey: .resourceId)
        
        self.videoId = try videoResourceContainer.decode(String.self, forKey: .videoId)
    }
}
