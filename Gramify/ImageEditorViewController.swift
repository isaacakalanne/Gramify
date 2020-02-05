//
//  ImageEditorViewController.swift
//  Gramify
//
//  Created by Isaac Akalanne on 04/02/2020.
//  Copyright © 2020 Believe And Succeed Apps. All rights reserved.
//

import UIKit

class ImageEditorViewController: UIViewController {
    
    @IBOutlet weak var imagePreview: UIImageView!
    @IBOutlet weak var filtersScrollView: UIScrollView!
    @IBOutlet weak var fadeTypeScrollView: UIScrollView!
    @IBOutlet weak var shareButton: UIButton!
    
    lazy var image = ImgurImage(imageDictionary: [String : Any]())

    override func viewDidLoad() {
        super.viewDidLoad()
        print("Title is \(image.title ?? "")")
        
        getData(fromURL: image.link!) { data in
            
            DispatchQueue.main.async {
                
                let imageFromData = UIImage(data: data!)
                self.imagePreview.alpha = 0
                self.imagePreview.image = imageFromData
                
                UIView.animate(withDuration: 0.4) {
                    self.imagePreview.alpha = 1
                }
            }
            
        }
        
    }
    
    func getData(fromURL urlString:String, completion: @escaping ((_ data: Data?) -> Void)) {
        let url = URL(string: urlString)!
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            completion(data)
        }.resume()
        
    }

}
