//
//  InstagramAPI.Swift
//  Photos
//
//  Created by Gene Yoo on 11/3/15.
//  Copyright © 2015 iOS DeCal. All rights reserved.
//

import Foundation

class InstagramAPI {
    
    var completion: (([Photo]) -> Void)!
    
    /* Connects with the Instagram API and pulls resources from the server. */
    func loadPhotos(completion: (([Photo]) -> Void)!) {
        /* 
         * 1. Get the endpoint URL to the popular photos 
         *    HINT: Look in Utils
         * 2. Create a Session
         * 3. Create a Data Task with a URL and completionHandler
         *    If no error:
         *       a. Get NSDictionary from the JSON object, from key the "photos"
         *       b. Create Array of NSDictionaries (one NSDictionary for each photo)
         *       c. For each NSDictionary, create a Photo object, and add to Photos array
         *       d. Wait for completion of Photos array
         */
        // FILL ME IN
        let url = NSURLRequest(URL: Utils.getPopularURL())
        self.completion = completion
        
        let task = NSURLSession.sharedSession().dataTaskWithRequest(url, completionHandler: myCompletionHandler)

        task.resume()
    }
    
    func myCompletionHandler(data: NSData?, response: NSURLResponse?, error: NSError?) {
        if error == nil {
            var photos: [Photo]!
            // FILL ME IN
            var jsonDict: NSDictionary
            
            do {
                jsonDict = try NSJSONSerialization.JSONObjectWithData(data!, options: NSJSONReadingOptions.AllowFragments) as! NSDictionary
            } catch let parseError {
                print(parseError)
                let jsonStr = NSString(data: data!, encoding: NSUTF8StringEncoding)
                print("Error could not parse JSON: '\(jsonStr)'")
                return
            }
            //photos = (jsonDict.objectForKey("photos") as? NSDictionary)!
            
            let images = jsonDict["data"] as! NSArray
            photos = [Photo]()
            for item in images {
                photos.append(Photo(data: item as! NSDictionary))
            }
            
            // DO NOT CHANGE BELOW
            let priority = DISPATCH_QUEUE_PRIORITY_DEFAULT
            dispatch_async(dispatch_get_global_queue(priority, 0)) {
                dispatch_async(dispatch_get_main_queue()) {
                    self.completion(photos)
                }
            }
        } else {
            print(error!.localizedDescription)
        }
    }
}