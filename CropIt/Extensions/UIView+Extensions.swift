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
    
    /// Set rounded corner for View
    /// - Parameter cornerRadius: radius for all corners
    func roundCorners(cornerRadius: CGFloat) {
        self.layer.cornerRadius = cornerRadius
        self.clipsToBounds = true
    }

    /// Set border for View
    /// - Parameters:
    ///   - width: brder width
    ///   - color: border color
    func border(width: CGFloat, color: UIColor) {
        self.layer.borderColor = color.cgColor
        self.layer.borderWidth = width
    }
    
    /// Blur background to view
    /// - Parameters:
    ///   - style: select style such as dark, light
    func setBlurBackground(style: UIBlurEffect.Style) -> UIView? {
        if !UIAccessibility.isReduceTransparencyEnabled {
            self.backgroundColor = .clear
            
            let blurEffect = UIBlurEffect(style: style)
            let blurEffectView = UIVisualEffectView(effect: blurEffect)
            
            // always fill the view
            blurEffectView.frame = self.bounds
            blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            
            return blurEffectView
        }
        return nil
    }
    
    func setShadowWithColor(color: UIColor, radius: CGFloat = 15.0) {
        self.layer.shadowOpacity = 0.7
        self.layer.shadowOffset = CGSize(width: 3, height: 3)
        self.layer.shadowRadius = radius
        self.layer.shadowColor = color.cgColor
    }
}

/// Set rounded corner for View
enum Corners {
    case all
    case bottoms
    case tops
    case rights
    case lefts
    case topLeft
    case topRight
    case bottomLeft
    case bottomRight
    case none

    func cornerMask() -> CACornerMask {
        switch self {
        case .all:
            return [.layerMinXMinYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        case .tops:
            return [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        case .bottoms:
            return [.layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        case .lefts:
            return [.layerMinXMinYCorner, .layerMinXMaxYCorner]
        case .rights:
            return [.layerMaxXMinYCorner, .layerMaxXMaxYCorner]
        case .topLeft:
            return [.layerMinXMinYCorner]
        case .topRight:
            return [.layerMaxXMinYCorner]
        case .bottomLeft:
            return [.layerMinXMaxYCorner]
        case .bottomRight:
            return [.layerMaxXMaxYCorner]
        case .none:
            return []
        }
    }
}
