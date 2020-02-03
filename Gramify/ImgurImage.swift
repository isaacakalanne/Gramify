//
//  ImgurImage.swift
//  Gramify
//
//  Created by Isaac Akalanne on 31/01/2020.
//  Copyright © 2020 Believe And Succeed Apps. All rights reserved.
//

import Foundation

class ImgurImage {
    
    let views: Int?
    let title: String?
    let dateTime: String?
    let link: String?
    let width: Int?
    let height: Int?
    
    struct ImgurKeys {
        static let views = "views"
        static let title = "description"
        static let dateTime = "datetime"
        static let link = "link"
        static let width = "width"
        static let height = "height"
    }
    
    init(imageDictionary: [String : Any]) {
        views = imageDictionary[ImgurKeys.views] as? Int
        title = imageDictionary[ImgurKeys.title] as? String
        link = imageDictionary[ImgurKeys.link] as? String
        width = imageDictionary[ImgurKeys.width] as? Int
        height = imageDictionary[ImgurKeys.height] as? Int
        
        let unixDateTime = imageDictionary[ImgurKeys.dateTime] as? Double
        let date = Date(timeIntervalSince1970: unixDateTime!)
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = .medium
        dateFormatter.dateStyle = .medium
        dateFormatter.timeZone = TimeZone(secondsFromGMT: 0)
        dateTime = dateFormatter.string(from: date)
    }
    
}
