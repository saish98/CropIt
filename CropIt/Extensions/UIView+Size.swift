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
}
