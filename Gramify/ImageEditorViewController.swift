//
//  ImageEditorViewController.swift
//  Gramify
//
//  Created by Isaac Akalanne on 04/02/2020.
//  Copyright © 2020 Believe And Succeed Apps. All rights reserved.
//

import UIKit

class ImageEditorViewController: UIViewController {
    
    lazy var image = ImgurImage(imageDictionary: [String : Any]())

    override func viewDidLoad() {
        super.viewDidLoad()
        print("Title is \(image.title ?? "")")
    }

}