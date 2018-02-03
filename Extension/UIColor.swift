//
//  UIColor.swift
//  DutyTimeCheck
//
//  Created by Sahidul Islam on 01/02/18.
//  Copyright © 2018 Sahidul Islam. All rights reserved.
//

import Foundation
import UIKit

////// Uicolor property
extension UIColor{
    static let lightGayAlpha = UIColor(red:50/255.0 , green:255/255.0 ,blue: 150/255.0 , alpha:1.0)
}

//////  Corner radius
extension UIView {
    
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = newValue > 0
        }
    }
    
    @IBInspectable var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }
    
    @IBInspectable var borderColor: UIColor? {
        get {
            return UIColor(cgColor: layer.borderColor!)
        }
        set {
            layer.borderColor = newValue?.cgColor
        }
    }
}




