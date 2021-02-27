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
            imageTaken = image
            btnCrop.isHidden = false
        }
    }
    
    @IBAction func btnCropPhoto(_ sender: UIButton) {
        let croppedImage = setImageToCrop(image: imageTaken)
        UIImageWriteToSavedPhotosAlbum(croppedImage, self, #selector(image(_:didFinishSavingWithError:contextInfo:)), nil)
    }
    
    func setImageToCrop(image: UIImage) -> UIImage {
        let visibleRect = scrollView.convert(scrollView.bounds, to: imageView)
        let croppedImage: UIImage!
        let maskLayer = CALayer()
        maskLayer.contents = image.cgImage
        maskLayer.frame = CGRect(x: 0, y: 0, width: visibleRect.size.width, height: visibleRect.size.height)
        let rect = CGRect(x: Double(visibleRect.origin.x / image.size.width),
                          y: Double(visibleRect.origin.y / image.size.height),
                          width: Double(visibleRect.size.width / image.size.width),
                          height: Double(visibleRect.size.height / image.size.height))
        maskLayer.contentsRect = rect
        UIGraphicsBeginImageContext(visibleRect.size)
        guard let context = UIGraphicsGetCurrentContext() else { return UIImage(named: "no_image")! }
        maskLayer.render(in: context)
        croppedImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return croppedImage
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
