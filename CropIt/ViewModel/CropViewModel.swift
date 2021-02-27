//
//  CropViewModel.swift
//  CropIt
//
//  Created by Deepak Thakur on 26/02/21.
//

import UIKit

final class CropViewModel {
    
    func setImageToCrop(image: UIImage,
                        scrollView: UIScrollView,
                        imageView: UIImageView) -> UIImage {
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
    
}
