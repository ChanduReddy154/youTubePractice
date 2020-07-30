//
//  VideoModel.swift
//  youTubePractice
//
//  Created by Chandu Reddy on 29/07/20.
//  Copyright © 2020 Chandu Reddy. All rights reserved.
//

import Foundation

protocol ModelDelegate {
    func videosFetched(_ videos: [VideosDetails])
}

class VideoModel {
    
    var delegate: ModelDelegate?
    
    func getVideosYouTube() {
        
        // create a Url Object
        
        let url = URL(string: Constants.API_URL)
        guard url != nil else {
            return
        }
        // Get a session object
        let session = URLSession.shared

        //get a data task from the url session object
        let datatask = session.dataTask(with: url!) { (data, response, error) in
            if error != nil || data == nil {
                return
            }
            
            do {
                // parsing json
                       let decoder = JSONDecoder()
                       decoder.dateDecodingStrategy = .iso8601
                let response = try decoder.decode(VideoResponse.self, from: data!)
                if response.videoItems != nil {
                    
                    DispatchQueue.main.async {
                        self.delegate?.videosFetched(response.videoItems!)
                    }
                    
                }
                    dump(response)
            }catch {
                print("Error in json parsing")
            }
        }
        //kick off task
        datatask.resume()
    }
    
}
