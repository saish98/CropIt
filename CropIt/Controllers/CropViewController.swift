//
//  CropViewController.swift
//  CropIt
//
//  Created by Deepak Thakur on 26/02/21.
//

import UIKit

class CropViewController: UIViewController {
    var viewModel: CropViewModel!

    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet var imageView: UIImageView!
    
    @IBOutlet weak var btnSelect: UIButton!
    @IBOutlet weak var btnCrop: UIButton!
    
    var imageTaken: UIImage!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.btnSelect.addShadow()
        btnCrop.isHidden = true
        scrollView.minimumZoomScale = 1.0
        scrollView.maximumZoomScale = 4.0
    }

    @IBAction func btnSelectPhoto(_ sender: Any) {
        btnCrop.isHidden = true
        ImagePickerManager().pickImage(self) { [self] image in
            imageView.image = image
            imageTaken = image //need to crop image taken
            btnCrop.isHidden = false
            setImageToCrop(image: image)
        }
    }
    
    @IBAction func btnCropPhoto(_ sender: UIButton) {
        //need to crop image taken
        UIImageWriteToSavedPhotosAlbum(imageTaken, self, #selector(image(_:didFinishSavingWithError:contextInfo:)), nil)
    }
    
    func setImageToCrop(image: UIImage) {
        
    }
    
    @objc func image(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
        if let error = error {
            let ac = UIAlertController(title: "Save error", message: error.localizedDescription, preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default))
            present(ac, animated: true)
        } else {
            let ac = UIAlertController(title: "Saved!", message: "Your altered image has been saved to your photos.", preferredStyle: .alert)
            ac.addAction(UIAlertAction(title: "OK", style: .default))
            present(ac, animated: true)
        }
    }
}

extension CropViewController: UIScrollViewDelegate {
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
    
    func scrollViewDidZoom(_ scrollView: UIScrollView) {
        if scrollView.zoomScale > scrollView.maximumZoomScale {
            scrollView.zoomScale = scrollView.maximumZoomScale
        } else if scrollView.zoomScale < scrollView.minimumZoomScale {
            scrollView.zoomScale = scrollView.minimumZoomScale
        }
    }
}
