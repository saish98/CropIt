//
//  CropViewController.swift
//  CropIt
//
//  Created by Deepak Thakur on 26/02/21.
//

import UIKit

class CropViewController: UIViewController, CircleCropViewControllerDelegate {
    var viewModel: CropViewModel!
    
    @IBOutlet var imageView: UIImageView!
    
    @IBOutlet weak var btnSelect: UIButton!
    @IBOutlet weak var btnTrash: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.btnSelect.addShadow()
        btnTrash.isHidden = true
        imageView.image = UIImage(named: "placeHolder")
        imageView.layer.cornerRadius = imageView.width/2
        imageView.clipsToBounds = true
    }
    
    private func initiateCropLoader(with image: UIImage) {
        let circleCropController = CircleCropViewController(withImage: image)
        circleCropController.delegate = self
        circleCropController.modalPresentationStyle = .fullScreen
        present(circleCropController, animated: false, completion: nil)
    }

    @IBAction func btnSelectPhoto(_ sender: Any) {
        btnTrash.isHidden = true
        ImagePickerManager().pickImage(self) { [self] image in
            btnTrash.isHidden = false
            initiateCropLoader(with: image)
        }
    }
    
    func circleCropDidCancel() {
        dismiss(animated: false, completion: nil)
    }
    
    func circleCropDidCropImage(_ image: UIImage) {
        imageView.image = image
        dismiss(animated: false, completion: nil)
    }
    
    @IBAction func btnTrashPhoto(_ sender: UIButton) {
        imageView.image = UIImage(named: "placeHolder")
    }
}
