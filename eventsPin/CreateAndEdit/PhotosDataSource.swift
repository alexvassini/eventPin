//
//  PhotosDataSource.swift
//  eventsPin
//
//  Created by Alexandre  Vassinievski on 12/07/17.
//  Copyright © 2017 Alexandre  Vassinievski. All rights reserved.
//

import Foundation
import UIKit
import Photos
import AVKit
import DKImagePickerController
import CHTCollectionViewWaterfallLayout


class PhotosDataSource: NSObject, UICollectionViewDataSource, UICollectionViewDelegate, CHTCollectionViewDelegateWaterfallLayout{
    
    var photoArray: [DKAsset] = []
    
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return photoArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "selectedImageCell", for: indexPath) as! SelectedImageCollectionViewCell
        let asset = self.photoArray[indexPath.row]
        
        cell.imageView.image = nil 
        
        asset.fetchOriginalImageWithCompleteBlock { (image, info) in
            
            cell.imageView.image = image
            
            
        }
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView!, layout collectionViewLayout: UICollectionViewLayout!, sizeForItemAt indexPath: IndexPath!) -> CGSize {
        
        return CGSize(width: 200, height: 250)
    }
    
}
