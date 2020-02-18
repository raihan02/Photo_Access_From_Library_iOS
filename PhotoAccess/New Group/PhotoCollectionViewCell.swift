//
//  PhotoCollectionViewCell.swift
//  PhotoAccess
//
//  Created by Twnibit_Raihan on 18/2/20.
//  Copyright © 2020 Twnibit_Raihan. All rights reserved.
//

import UIKit

class PhotoCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var photoImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        photoImageView.contentMode = .scaleAspectFill
        photoImageView.clipsToBounds = true
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        photoImageView.frame = self.bounds
    }
    

}
