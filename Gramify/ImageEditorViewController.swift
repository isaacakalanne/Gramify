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
                let filterImage = UIImage(named: "oceanWaveOriginal")
                self.applyFilter(toImage: imageFromData!, withFilterImage: filterImage!) { filteredImage in
                    
                    self.imagePreview.image = filteredImage
                    
                    UIView.animate(withDuration: 0.4) {
                        self.imagePreview.alpha = 1
                    }
                    
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
    
    func applyFilter(toImage image : UIImage , withFilterImage filterImage : UIImage , completion : @escaping ((_ filteredImage : UIImage) -> Void)) {
        let originalImage = CIImage(image: image)
        let filterImage = CIImage(image: filterImage)
        let filter = CIFilter(name: "CIScreenBlendMode")
        filter?.setValue(originalImage, forKey: "inputBackgroundImage")
        filter?.setValue(filterImage, forKey: "inputImage")
        
        let imageRef = (filter?.outputImage!.cropped(to: (filter?.outputImage!.extent)!))!
        let imageWithFilter = UIImage(ciImage: imageRef, scale: image.scale, orientation: image.imageOrientation)
        completion(imageWithFilter)
    }

}
