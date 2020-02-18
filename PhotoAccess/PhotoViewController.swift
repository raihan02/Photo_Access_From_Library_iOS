//
//  PhotoViewController.swift
//  PhotoAccess
//
//  Created by Twnibit_Raihan on 18/2/20.
//  Copyright © 2020 Twnibit_Raihan. All rights reserved.
//

import UIKit
import Photos
class PhotoViewController: UIViewController {
    
    @IBOutlet weak var photoCollectionView: UICollectionView!
    var imageArray=[UIImage]()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Photo"
        photoCollectionView.dataSource = self
        photoCollectionView.delegate = self
        photoCollectionView.backgroundColor=UIColor.white
        let nib = UINib (nibName: "PhotoCollectionViewCell", bundle: nil)
        photoCollectionView.register(nib, forCellWithReuseIdentifier: "PhotoCollectionViewCell")
        photoCollectionView.autoresizingMask = UIView.AutoresizingMask(rawValue: UIView.AutoresizingMask.RawValue(UInt8(UIView.AutoresizingMask.flexibleWidth.rawValue) | UInt8(UIView.AutoresizingMask.flexibleHeight.rawValue)))
            getPhotosFromLibrary()
    }
    
    override func viewWillLayoutSubviews() {
           super.viewWillLayoutSubviews()
           photoCollectionView.collectionViewLayout.invalidateLayout()
       }
    
    //MARK: Get Photos from Library
    func getPhotosFromLibrary(){
        
        imageArray = []
        
        DispatchQueue.global(qos: .background).async {
            print("This is run on the background queue")
            let imgManager=PHImageManager.default()
            
            let requestOptions=PHImageRequestOptions()
            requestOptions.isSynchronous=true
            requestOptions.deliveryMode = .highQualityFormat
            
            let fetchOptions=PHFetchOptions()
            fetchOptions.sortDescriptors=[NSSortDescriptor(key:"creationDate", ascending: false)]
            
            let fetchResult: PHFetchResult = PHAsset.fetchAssets(with: .image, options: fetchOptions)
            print(fetchResult)
            print(fetchResult.count)
            if fetchResult.count > 0 {
                for i in 0..<fetchResult.count{
                    imgManager.requestImage(for: fetchResult.object(at: i) as PHAsset, targetSize: CGSize(width:500, height: 500),contentMode: .aspectFill, options: requestOptions, resultHandler: { (image, error) in
                        self.imageArray.append(image!)
                    })
                }
            } else {
                print("You got no photos.")
            }
            print("imageArray count: \(self.imageArray.count)")
            
            DispatchQueue.main.async {
                print("This is run on the main queue, after the previous code in outer block")
                self.photoCollectionView.reloadData()
            }
        }
    }

}
extension PhotoViewController : UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout{
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell=collectionView.dequeueReusableCell(withReuseIdentifier: "PhotoCollectionViewCell", for: indexPath) as! PhotoCollectionViewCell
        cell.photoImageView.image=imageArray[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(indexPath)
        let story = storyboard?.instantiateViewController(withIdentifier: "PhotoShowViewController") as! PhotoShowViewController
        story.imageVariable = imageArray[indexPath.row]
        print(imageArray)
        self.navigationController?.pushViewController(story, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.width
        if DeviceInfo.Orientation.isPortrait {
            return CGSize(width: width/4 - 1, height: width/4 - 1)
        } else {
            return CGSize(width: width/6 - 1, height: width/6 - 1)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1.0
    }
    
}
    

