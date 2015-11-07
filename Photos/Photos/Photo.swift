//
//  Photo.swift
//  Photos
//
//  Created by Gene Yoo on 11/3/15.
//  Copyright © 2015 iOS DeCal. All rights reserved.
//

import Foundation

class Photo {
    /* The number of likes the photo has. */
    var likes : Int!
    /* The string of the url to the photo file. */
    var url : String!
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
        
        //url = data["images"]["thumbnail"]["url"]
        if let i = data["images"] as! NSDictionary! {
            if let j = i["thumbnail"] as! NSDictionary! {
                if let k = j["url"] as! String! {
                    url = k
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
}