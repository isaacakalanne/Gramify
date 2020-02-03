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
        
        createListOfImagesFromUrlString(urlString) { imageList -> Void in
            
            self.images.append(contentsOf: imageList)
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
            
        }
    }
    
    func createListOfImagesFromUrlString(_ urlString: String, completion: @escaping ([ImgurImage]) -> Void) {
        
        var images = [ImgurImage]()
        let url = URL(string: urlString)!
        let networkProcessor = NetworkProcessor(url: url)
        
        networkProcessor.downloadJSONFromURL { (jsonDictionary) in
            
            if let listOfImages = jsonDictionary?["data"] as? Array<Any> {
                
                for image in listOfImages {
                    let imageData = image as? [String : Any]
                    let imgurImage = ImgurImage(imageDictionary: imageData!)
                    images.append(imgurImage)
                }
                
                completion(images)
            }
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return images.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier = "ImageTableViewCell"
        let image = images[indexPath.row]
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? ImageTableViewCell  else {
            fatalError("The dequeued cell is not an instance of ImageTableViewCell.")
        }
        
        cell.titleLabel.text = "Title: \(image.title ?? "")"
        cell.widthLabel.text = "Width: \(image.width ?? 0)"
        cell.heightLabel.text = "Height: \(image.height ?? 0)"
        
        cell.uploadDateLabel.text = image.dateTime
        cell.uploadTimeLabel.text = image.dateTime
        cell.viewsLabel.text = "Views: \(image.views ?? 0)"
        
        return cell
    }

}
