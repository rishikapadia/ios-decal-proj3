//
//  Photo.swift
//  Photos
//
//  Created by Gene Yoo on 11/3/15.
//  Copyright © 2015 iOS DeCal. All rights reserved.
//

import Foundation
import UIKit

class Photo {
    /* The number of likes the photo has. */
    var likes : Int!
    /* The string of the url to the photo file. */
    var thumbnailURL : String!
    /* The thumbnail of the photo. */
    var thumbnail : UIImage!
    /* The string of the url to the low res photo file. */
    var lowResURL : String!
    /* The low res photo. */
    var lowRes : UIImage!
    /* The username of the photographer. */
    var username : String!

    /* Parses a NSDictionary and creates a photo object. */
    init (data: NSDictionary) {
        // FILL ME IN

        //likes = data["likes"]["count"]
        if let i = data["likes"] as! NSDictionary! {
            if let j = i["count"] as! Int! {
                likes = j
            }
        }
        
        //thumbnailURL = data["images"]["thumbnail"]["url"]
        if let i = data["images"] as! NSDictionary! {
            if let j = i["thumbnail"] as! NSDictionary! {
                if let k = j["url"] as! String! {
                    thumbnailURL = k
                }
            }
        }
        
        //lowResURL = data["images"]["thumbnail"]["url"]
        if let i = data["images"] as! NSDictionary! {
            if let j = i["low_resolution"] as! NSDictionary! {
                if let k = j["url"] as! String! {
                    lowResURL = k
                }
            }
        }
        
        //username = data["caption"]["from"]["username"]
        if let i = data["user"] as! NSDictionary! {
            if let j = i["username"] as! String! {
                username = j
            }
        }
    }
    
    func loadThumbnail() -> UIImage {
        if thumbnail != nil {
            return thumbnail
        }
        let url_ = NSURL(string: thumbnailURL)
        if let data = NSData(contentsOfURL: url_!) {
            thumbnail = UIImage(data: data)
        }
        
        return thumbnail
    }
    
    func loadLowRes() -> UIImage {
        if lowRes != nil {
            return lowRes
        }
        let url_ = NSURL(string: lowResURL)
        if let data = NSData(contentsOfURL: url_!) {
            lowRes = UIImage(data: data)
        }
        return lowRes
    }
}