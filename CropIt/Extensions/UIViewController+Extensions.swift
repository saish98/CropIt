//
//  UIViewController+Extensions.swift
//  CropIt
//
//  Created by Deepak Thakur on 26/02/21.
//

import UIKit

extension UIViewController {
    static func instantiate<T>() -> T {
        let storyboard = UIStoryboard(name: "Main", bundle: .main)
        let controller = storyboard.instantiateViewController(identifier: "\(T.self)") as! T
        return controller
    }
}
