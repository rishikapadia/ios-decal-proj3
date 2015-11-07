//
//  PhotosCollectionViewController.swift
//  Photos
//
//  Created by Gene Yoo on 11/3/15.
//  Copyright © 2015 iOS DeCal. All rights reserved.
//

import UIKit

class PhotosCollectionViewController: UICollectionViewController {

    var api = InstagramAPI()
    private let reuseIdentifier = "PhotoCell"
    var photos: [Photo]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        photos = [Photo]()
        api.loadPhotos(didLoadPhotos)
        // FILL ME IN
    }
    
    override func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    override func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return photos.count
    }
    
    override func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! PhotoCollectionViewCell
        
        loadImageForCell(photos[indexPath.row], imageView: cell.imageView)
        
        if indexPath.row > photos.count - 3 {
            api.loadPhotos(didLoadPhotos)
        }
        
        return cell
    }
    
    override func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        // Segue
        print("Selected row \(indexPath.row) out of \(photos.count - 1)")
        return
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize {
            
        let photo =  photos[indexPath.row]
        let thumbnail = photo.loadThumbnail()
        return thumbnail.size
        
        /*if let thumbnail = photo.thumbnail {
            var size = thumbnail.size
            size.width += 10
            size.height += 10
            return size
        }
        return CGSize(width: 100, height: 100)*/
    }

    /* 
     * IMPLEMENT ANY COLLECTION VIEW DELEGATE METHODS YOU FIND NECESSARY
     * Examples include cellForItemAtIndexPath, numberOfSections, etc.
     */
    
    /* Creates a session from a photo's url to download data to instantiate a UIImage. 
       It then sets this as the imageView's image. */
    func loadImageForCell(photo: Photo, imageView: UIImageView) {
        imageView.image = photo.loadThumbnail()
    }
    
    /* Completion handler for API call. DO NOT CHANGE */
    func didLoadPhotos(photos: [Photo]) {
        self.photos.appendContentsOf(photos)
        self.collectionView!.reloadData()
    }
    
}

