//
//  UIView+Extensions.swift
//  CropIt
//
//  Created by Deepak Thakur on 26/02/21.
//

import UIKit
import CoreGraphics

extension UIView {
    func addShadow() {
        self.layer.shadowColor = UIColor.blue.cgColor
        self.layer.shadowOpacity = 1
        self.layer.shadowOffset = .zero
        self.layer.shadowOpacity = 0.2
        self.layer.shadowRadius = 2.0
        let cornerRadius = self.frame.size.height / 2
        self.layer.shadowPath = UIBezierPath(roundedRect: self.bounds, cornerRadius: cornerRadius).cgPath
    }
}
