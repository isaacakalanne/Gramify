//
//  ImageListTableViewController.swift
//  Gramify
//
//  Created by Isaac Akalanne on 29/01/2020.
//  Copyright © 2020 Believe And Succeed Apps. All rights reserved.
//

import UIKit

class ImageListTableViewController: UITableViewController {
    
    var images = [ImgurImage]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let urlString = "https://api.imgur.com/3/album/B0fnjzW/images"
        images = getImagesFromUrlString(urlString)
        
    }
    
    func getImagesFromUrlString(_ urlString: String) -> [ImgurImage] {
        
        var images = [ImgurImage]()
        let url = URL(string: urlString)!
        let networkProcessor = NetworkProcessor(url: url)
        
        networkProcessor.downloadJSONFromURL { (jsonDictionary) in
            
            if let listOfImages = jsonDictionary?["data"] as? Array<Any> {
                
                for image in listOfImages {
                    let imageData = image as? [String : Any]
                    let imgurImage = ImgurImage(imageDictionary: imageData!)
                    images += [imgurImage]
                }
                
            }
            
        }
        return images
    }
    
//    override func numberOfSections(in tableView: UITableView) -> Int {
//
//    }
//
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//
//    }
//
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//
//    }

}
