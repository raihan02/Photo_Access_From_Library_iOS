//
//  ImagePreviewCollectionViewCell.swift
//  PhotoAccess
//
//  Created by Twnibit_Raihan on 18/2/20.
//  Copyright © 2020 Twnibit_Raihan. All rights reserved.
//

import UIKit

class ImagePreviewCollectionViewCell: UICollectionViewCell {

    
    @IBOutlet weak var previewImage: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        previewImage.contentMode = .scaleAspectFit
    }
    
}
