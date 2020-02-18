//
//  PhotoShowViewController.swift
//  PhotoAccess
//
//  Created by Twnibit_Raihan on 18/2/20.
//  Copyright © 2020 Twnibit_Raihan. All rights reserved.
//

import UIKit

class PhotoShowViewController:
UIViewController {
    
    @IBOutlet weak var imageShow: UIImageView!
    var imageVariable : UIImage?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .black
        imageShow.image = imageVariable
    }
}
