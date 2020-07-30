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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // confirm that video is selected
               guard tableView.indexPathForSelectedRow != nil  else {
                   return
               }
               // reference to the video when tapped
               let selectedVideo = youVideos[tableView.indexPathForSelectedRow!.row]
               
               //get a reference to the video view controller
               let videosVC = segue.destination as! VideosViewController
        
                //set the video property of the videoviewcontroller
                videosVC.videoPlay = selectedVideo
    }
       
     
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return youVideos.count
       }
       
       func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "VideoCell", for: indexPath) as! VideoTableViewCell
        
        let videos = self.youVideos[indexPath.row]
        cell.videoCell(videos)
       return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}

