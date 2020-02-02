//
//  ImageListTableViewController.swift
//  Gramify
//
//  Created by Isaac Akalanne on 29/01/2020.
//  Copyright © 2020 Believe And Succeed Apps. All rights reserved.
//

import UIKit

class ImageListTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = URL(string: "https://api.imgur.com/3/album/B0fnjzW/images")
        let networkProcessor = NetworkProcessor(url: url!)
        networkProcessor.downloadJSONFromURL { (jsonDictionary) in
            
            if let listOfImages = jsonDictionary?["data"] as? Array<Any> {
                let imageData = listOfImages[0] as? [String : Any]
                let imgurImage = ImgurImage(imageDictionary: imageData!)
                print(imgurImage.dateTime!)
            }
            
        }
        
    }

}
