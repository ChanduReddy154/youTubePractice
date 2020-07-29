//
//  Constants.swift
//  youTubePractice
//
//  Created by Chandu Reddy on 29/07/20.
//  Copyright © 2020 Chandu Reddy. All rights reserved.
//

import Foundation

struct Constants {
    static var API_KEY = "AIzaSyDcO6S7K9gM4Jay8E2cvJsuV6FSpRkkLJk"
    static var PLAYLIST_ID = "RDhoNb6HuNmU0"
    static var API_URL = "https://www.googleapis.com/youtube/v3/playlistItems?part=snippet&playlistId=\(Constants.PLAYLIST_ID)0&key=\(Constants.API_KEY)"
}
