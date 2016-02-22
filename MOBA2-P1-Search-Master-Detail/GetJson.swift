//
//  GetJson.swift
//  icf-books
//
//  Created by Andreas Plüss on 18.02.16.
//  Copyright © 2016 devkitchen. All rights reserved.
//

import Foundation
import UIKit

/// This class is responsible to retrieve JSON formated text from a server and enables you to then get the data as Dictionary
class GetJson {
    /**
     Requests data from the instances defined URL.
     - parameter completionHandler: is a function responsible to proceed with the retrieved data.
     */
    static func eachInstaPostFrom(url: NSURL, forEveryPost: (result: InstaPost?) -> ()) {
        let session = NSURLSession.sharedSession()
        let task = session.dataTaskWithURL(url) {
            (data, response, error) -> Void in
            
            do {
                if data != nil {
                    let dataDict = try NSJSONSerialization.JSONObjectWithData(data!, options:NSJSONReadingOptions.MutableContainers ) as! NSDictionary
                    let dataArray = dataDict.valueForKey("data") as! NSArray
                    
                    for post in dataArray {
                        let postDict = post as? NSDictionary
                        
                        let userDict = postDict!.valueForKey("user") as? NSDictionary
                        let username = userDict!.valueForKey("username") as? String
                        
                        let link = postDict!.valueForKey("link") as? String
                        
                        var likeNr = "0"
                        let likes = postDict!.valueForKey("likes") as? NSDictionary
                        if likes != nil {
                            if let count = likes!.valueForKey("count") as? Int {
                                likeNr = String(count)
                            }
                        }
                        
                        var image = UIImage()
                        if postDict != nil {
                            let imagesDict = postDict!.valueForKey("images") as? NSDictionary
                            if imagesDict != nil {
                                let imageDict = imagesDict!.valueForKey("standard_resolution") as? NSDictionary
                                let imageLocation = imageDict!.valueForKey("url") as? String
                                let imageUrl = NSURL(string: imageLocation!)
                                let imageData = NSData(contentsOfURL: imageUrl!)
                                image = imageData.map({UIImage(data: $0)})!!
                            }
                            
                        }
                        
                        var comment = ""
                        let caption = postDict!.valueForKey("caption") as? NSDictionary
                        if caption != nil {
                            if let instaComment = caption!.valueForKey("text") as? String {
                                comment = instaComment
                            }
                        }
                        
                        
                        
                        forEveryPost(result: InstaPost.init(image: image, desc: comment, user: username!, likes: likeNr, link: link!))
                    }
                } else {
                    print("NoInternet")
                }
                
            } catch {
                print("JsonParsingError")
            }
            
            forEveryPost(result: nil)
        }
        
        task.resume()
    }
}
