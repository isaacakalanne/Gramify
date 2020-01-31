//
//  ImgurImage.swift
//  Gramify
//
//  Created by Isaac Akalanne on 31/01/2020.
//  Copyright © 2020 Believe And Succeed Apps. All rights reserved.
//

import Foundation

class ImgurImage {
    
    let id: String?
    let link: String?
    let width: Int?
    let height: Int?
    
    struct ImgurKeys {
        static let id = "id"
        static let link = "link"
        static let width = "width"
        static let height = "height"
    }
    
    init(imageDictionary: [String : Any]) {
        id = imageDictionary[ImgurKeys.id] as? String
        link = imageDictionary[ImgurKeys.link] as? String
        width = imageDictionary[ImgurKeys.width] as? Int
        height = imageDictionary[ImgurKeys.height] as? Int
    }
    
}
