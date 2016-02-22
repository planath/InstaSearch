//
//  Api.swift
//  icf-books
//
//  Created by Andreas Plüss on 20.02.16.
//  Copyright © 2016 devkitchen. All rights reserved.
//

import Foundation


class Api {
    static let baseUrl = "https://api.instagram.com/v1/tags/"
    static let urlExtension = "/media/recent?client_id=8015881f631a4433b998443d7a6f368d"
    
    static func urlWithTag(tag:String = "ZHAW") -> NSURL {
        var instaTag = tag
        instaTag = instaTag.stringByReplacingOccurrencesOfString("#", withString: "")
        instaTag = instaTag.stringByReplacingOccurrencesOfString(" ", withString: "")
        instaTag = instaTag.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceAndNewlineCharacterSet())
        if instaTag == "" {
            instaTag = "ZHAW"
        }
        return NSURL(string: baseUrl + instaTag + urlExtension)!
    }

}