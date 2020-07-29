//
//  ViewController.swift
//  youTubePractice
//
//  Created by Chandu Reddy on 23/06/20.
//  Copyright © 2020 Chandu Reddy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let video = VideoModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        video.getVideosYouTube()
        
    }


}

