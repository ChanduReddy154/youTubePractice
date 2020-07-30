//
//  VideosViewController.swift
//  youTubePractice
//
//  Created by Chandu Reddy on 30/07/20.
//  Copyright © 2020 Chandu Reddy. All rights reserved.
//

import UIKit
import WebKit

class VideosViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var textView: UITextView!
    
    var videoPlay : VideosDetails?
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    override func viewWillAppear(_ animated: Bool) {
        // clearing the fields
        titleLabel.text = ""
        textView.text = ""
        
        //check if there is video
        
        guard videoPlay != nil else {
            return
        }
        
        // create the URL
        
        let embedUrl  = Constants.EMBED_URL + videoPlay!.videoId
        
        // load into web view
        let url = URL(string: embedUrl)
        let request = URLRequest(url: url!)
        webView.load(request)
        
        // set the titile
        titleLabel.text = videoPlay?.videoTitle
        
        //set the description
        textView.text = videoPlay?.videoDescription
    }

}
