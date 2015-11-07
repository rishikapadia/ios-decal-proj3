//
//  PhotoDetailsViewController.swift
//  Photos
//
//  Created by Rishi Kapadia on 11/7/15.
//  Copyright © 2015 iOS DeCal. All rights reserved.
//

import UIKit

class PhotoDetailsViewController: UIViewController {

    var photo: Photo!
    
    @IBOutlet var imageView: UIImageView!
    @IBOutlet var username: UILabel!
    @IBOutlet var datePosted: UILabel!
    @IBOutlet var likes: UILabel!
    
    @IBOutlet var heart: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        imageView.image = photo.loadLowRes()
        imageView.contentMode = .ScaleAspectFit
        username.text = photo.username
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateStyle = NSDateFormatterStyle.LongStyle
        dateFormatter.timeStyle = .MediumStyle
        datePosted.text = dateFormatter.stringFromDate(photo.datePosted)
        likes.text = "\(photo.likes) likes"
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
