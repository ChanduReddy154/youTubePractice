//
//  ViewController.swift
//  youTubePractice
//
//  Created by Chandu Reddy on 23/06/20.
//  Copyright © 2020 Chandu Reddy. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, ModelDelegate{
    
    @IBOutlet weak var tableView: UITableView!
    let model = VideoModel()
    var youVideos = [VideosDetails]()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        model.delegate = self
        model.getVideosYouTube()
        
    }

    func videosFetched(_ videos: [VideosDetails]) {
        self.youVideos = videos
        
        tableView.reloadData()
     }
     
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return youVideos.count
       }
       
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "VideoCell", for: indexPath)
        let title = self.youVideos[indexPath.row].videoTitle
        cell.textLabel?.text = title
       return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

