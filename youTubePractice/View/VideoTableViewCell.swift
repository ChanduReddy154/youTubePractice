//
//  VideoTableViewCell.swift
//  youTubePractice
//
//  Created by Chandu Reddy on 30/07/20.
//  Copyright © 2020 Chandu Reddy. All rights reserved.
//

import UIKit

class VideoTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var thumbnailImage: UIImageView!
    
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var dateLabel: UILabel!
    
    var videos: VideosDetails?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    func videoCell(_ video: VideosDetails) {
        self.videos = video
        
        //check if there is video
        guard self.videos != nil else {
            return
        }
        
        self.titleLabel.text = videos?.videoTitle
        
        let df = DateFormatter()
        df.dateFormat = "EEEE, MMM d, yyyy"
        self.dateLabel.text = df.string(from: videos!.published)
        
        // set the thumbnail
        guard self.videos!.videoThumbnail != "" else {
            return
        }
       //downloading the thumbnail
        let url = URL(string: self.videos!.videoThumbnail)
        
        
        let session = URLSession.shared
        
        // create a datatask
        
        let dataTask = session.dataTask(with: url!) { (data, response, error) in
            if error == nil && data != nil {
                
                // check the downloaded video matches the video thumnail
                
                if url?.absoluteString != self.videos?.videoThumbnail {
                    return
                }
                
                // creating the image object
                let image = UIImage(data: data!)
                
                //setting the imageview
                
                DispatchQueue.main.async {
                    self.thumbnailImage.image = image
                }
                
            }
        }
        // start the datatask
        dataTask.resume()
    }
}
