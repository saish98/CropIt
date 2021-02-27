//
//  UIView+Size.swift
//  Popviewers
//
//  Created by saish98 on 25/09/19.
//  Copyright © 2019 Heady. All rights reserved.
//

import Foundation
import UIKit

extension UIView {

    /// Get Set x Position
    var xAxis: CGFloat {
        get {
            return self.frame.origin.x
        }
        set {
            self.frame.origin.x = newValue
        }
    }

    /// Get Set y Position
    var yAxis: CGFloat {
        get {
            return self.frame.origin.y
        }
        set {
            self.frame.origin.y = newValue
        }
    }

    /// Get Set Height
    var height: CGFloat {
        get {
            return self.frame.size.height
        }
        set {
            self.frame.size.height = newValue
        }
    }

    ///  Get Set Width
    var width: CGFloat {
        get {
            return self.frame.size.width
        }
        set {
            self.frame.size.width = newValue
        }
    }

    ///  Get Right side of view
    var right: CGFloat {
        return self.frame.size.width + self.frame.origin.x
    }

    ///  Get bottom of view
    var bottom: CGFloat {
        return self.frame.size.height + self.frame.origin.y
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

  
      /// Sets the session/home screen tab shadow
      /// - Parameter color: Colour for the shadow.
      func setSessionHomeShadow(with color: UIColor) {
          self.layer.masksToBounds = false
          self.layer.shadowOpacity = 1
          self.layer.shadowOffset = CGSize(width: 0, height: 12)
          self.layer.shadowRadius = 9.0
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
