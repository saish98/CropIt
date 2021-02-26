//
//  CropViewController.swift
//  CropIt
//
//  Created by Deepak Thakur on 26/02/21.
//

import UIKit

class CropViewController: UIViewController {
    var viewModel: CropViewModel!

    @IBOutlet weak var imgPicked: UIImageView!
    @IBOutlet weak var btnSelect: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.btnSelect.addShadow()
    }

    @IBAction func btnSelectPhoto(_ sender: Any) {
        ImagePickerManager().pickImage(self) { [self] image in
            imgPicked.image = image;
        }
    }
    
}

