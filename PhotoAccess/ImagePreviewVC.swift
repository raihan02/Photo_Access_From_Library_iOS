//
//  ImagePreviewVC.swift
//  PhotoAccess
//
//  Created by Twnibit_Raihan on 18/2/20.
//  Copyright © 2020 Twnibit_Raihan. All rights reserved.
//

import UIKit
import Photos
class ImagePreviewVC: UIViewController,UICollectionViewDelegate, UICollectionViewDataSource {
   
    
    @IBOutlet weak var viewPhotoCollectionView: UICollectionView!
    var imgArray = [UIImage]()
    var passedContentOffset = IndexPath()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor=UIColor.black
        viewPhotoCollectionView.delegate = self
        viewPhotoCollectionView.dataSource = self
        let nib = UINib(nibName: "ImagePreviewCollectionViewCell", bundle: nil)
        
        viewPhotoCollectionView.register(nib, forCellWithReuseIdentifier: "ImagePreviewCollectionViewCell")
        viewPhotoCollectionView.isPagingEnabled = true
        viewPhotoCollectionView.scrollToItem(at: passedContentOffset, at: .left, animated: true)
        //self.view.addSubview(myCollectionView)
        
        viewPhotoCollectionView.autoresizingMask = UIView.AutoresizingMask(rawValue: UIView.AutoresizingMask.RawValue(UInt8(UIView.AutoresizingMask.flexibleWidth.rawValue) | UInt8(UIView.AutoresizingMask.flexibleHeight.rawValue)))

    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        imgArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell=collectionView.dequeueReusableCell(withReuseIdentifier: "ImagePreviewCollectionViewCell", for: indexPath) as! ImagePreviewCollectionViewCell
        cell.previewImage.image = imgArray[indexPath.row]
        return cell
        
    }
    

}
