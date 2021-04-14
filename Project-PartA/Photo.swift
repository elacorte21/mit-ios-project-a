//
//  Photo.swift
//  UserDefaultDemo
//
//  Created by Eddril Lacorte on 7/11/20.
//  Copyright © 2020 EL. All rights reserved.
//

import Foundation
import UIKit

class Photo: NSObject, NSCoding {
    
    var title: String
    var desc: String
    var pic: UIImage
    var date: String
    
    init(title: String, desc: String, pic: UIImage, date: String) {
        self.title = title
        self.desc = desc
        self.pic = pic
        self.date = date
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(title, forKey: "title")
        aCoder.encode(desc, forKey: "desc")
        aCoder.encode(pic, forKey: "pic")
        aCoder.encode(date, forKey: "date")
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.title = aDecoder.decodeObject(forKey: "title") as! String
        self.desc = aDecoder.decodeObject(forKey: "desc") as! String
        self.pic = aDecoder.decodeObject(forKey: "pic") as! UIImage
        self.date = aDecoder.decodeObject(forKey: "date") as! String
    }
    
}
