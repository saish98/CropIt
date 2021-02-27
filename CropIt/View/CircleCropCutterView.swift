//
//  CircleCropCutterView.swift
//  CropIt
//
//  Created by Deepak Thakur on 27/02/2021.
//

import UIKit

class CircleCropCutterView: UIView {
    override var frame: CGRect {
        didSet {
            setNeedsDisplay()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.isOpaque = false
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.isOpaque = false
    }

    override func draw(_ rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()
        UIColor(red: 0.0, green: 0.0, blue: 0.0, alpha: 0.7).setFill()
        UIRectFill(rect)
        
        //This is the same rect as the UIScrollView size 240 * 240, remains centered
        let circle = UIBezierPath(ovalIn: CGRect(x: rect.size.width/2 - Constants.CROP_SIZE/2, y: rect.size.height/2 - Constants.CROP_SIZE/2, width: Constants.CROP_SIZE, height: Constants.CROP_SIZE))
        context?.setBlendMode(.clear)
        UIColor.clear.setFill()
        circle.fill()
    }
    
    //Allow touches through the circle crop cutter view
    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        for subview in subviews as [UIView] {
            if !subview.isHidden && subview.alpha > 0 && subview.isUserInteractionEnabled && subview.point(inside: convert(point, to: subview), with: event) {
                return true
            }
        }
        return false
    }
}
