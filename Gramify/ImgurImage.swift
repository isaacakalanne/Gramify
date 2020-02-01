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
    let title: String?
    let dateTime: String?
    let link: String?
    let width: Int?
    let height: Int?
    
    struct ImgurKeys {
        static let id = "id"
        static let title = "title"
        static let dateTime = "datetime"
        static let link = "link"
        static let width = "width"
        static let height = "height"
    }
    
    init(imageDictionary: [String : Any]) {
        id = imageDictionary[ImgurKeys.id] as? String
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
