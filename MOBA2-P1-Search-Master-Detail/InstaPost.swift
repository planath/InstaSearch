//
//  InstaPost.swift
//  MOBA2-P1-Search-Master-Detail
//
//  Created by Andreas Plüss on 22.02.16.
//  Copyright © 2016 devkitchen. All rights reserved.
//

import Foundation
import UIKit

class InstaPost {
    
    var image:UIImage
    var desc:String
    var user:String
    var likes:String
    var link:NSURL
    
    init(image:UIImage, desc:String, user:String, likes:String, link:String) {
        self.user = user
        self.desc = desc
        self.image = image
        self.likes = likes
        self.link = NSURL(string: link)!
    }
}