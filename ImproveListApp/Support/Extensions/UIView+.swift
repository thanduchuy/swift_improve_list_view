//
//  UIView.swift
//  ImproveListApp
//
//  Created by than.duc.huy on 14/7/25.
//

import Foundation
import UIKit

extension UIView {
    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
    
    func applyDiagonalGradient(colors: [UIColor], cornerRadius: CGFloat = 0.0) {
        self.layer.sublayers?.filter({ $0 is CAGradientLayer }).forEach({ $0.removeFromSuperlayer() })
        
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = self.bounds
        gradientLayer.colors = colors.map { $0.cgColor }
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        
        gradientLayer.cornerRadius = cornerRadius
        gradientLayer.masksToBounds = true
        
        self.layer.insertSublayer(gradientLayer, at: 0)
    }
    
    func embossedNeumorphism(cornerRadius: CGFloat,
                             backgroundColor: UIColor,
                             lightShadowColor: UIColor,
                             darkShadowColor: UIColor,
                             shadowRadius: CGFloat = 8,
                             shadowOpacity: Float = 0.5) {
        layer.sublayers?.filter { $0.name == "neumorphismShadow" }.forEach { $0.removeFromSuperlayer() }
        
        self.layer.cornerRadius = cornerRadius
        self.backgroundColor = backgroundColor
        self.clipsToBounds = false
        
        // (top-left)
        let lightShadow = CALayer()
        lightShadow.name = "neumorphismShadow"
        lightShadow.frame = bounds
        lightShadow.cornerRadius = cornerRadius
        lightShadow.backgroundColor = backgroundColor.cgColor
        lightShadow.shadowColor = lightShadowColor.cgColor
        lightShadow.shadowOffset = CGSize(width: -shadowRadius, height: -shadowRadius)
        lightShadow.shadowRadius = shadowRadius
        lightShadow.shadowOpacity = shadowOpacity
        layer.insertSublayer(lightShadow, at: 0)
        
        // (bottom-right)
        let darkShadow = CALayer()
        darkShadow.name = "neumorphismShadow"
        darkShadow.frame = bounds
        darkShadow.cornerRadius = cornerRadius
        darkShadow.backgroundColor = backgroundColor.cgColor
        darkShadow.shadowColor = darkShadowColor.cgColor
        darkShadow.shadowOffset = CGSize(width: shadowRadius, height: shadowRadius)
        darkShadow.shadowRadius = shadowRadius
        darkShadow.shadowOpacity = shadowOpacity
        layer.insertSublayer(darkShadow, at: 0)
    }
    
    func pressedNeumorphism(cornerRadius: CGFloat,
                            backgroundColor: UIColor,
                            lightShadowColor: UIColor,
                            darkShadowColor: UIColor,
                            shadowRadius: CGFloat = 8,
                            shadowOpacity: Float = 0.5) {
        layer.sublayers?.filter { $0.name == "neumorphismShadow" }.forEach { $0.removeFromSuperlayer() }
        
        self.layer.cornerRadius = cornerRadius
        self.backgroundColor = backgroundColor
        self.clipsToBounds = true
        
        let innerShadowLayer = CALayer()
        innerShadowLayer.name = "neumorphismShadow"
        innerShadowLayer.frame = bounds
        innerShadowLayer.cornerRadius = cornerRadius
        innerShadowLayer.masksToBounds = true
        
        // (bottom-right)
        let lightInnerShadow = CALayer()
        lightInnerShadow.frame = bounds
        lightInnerShadow.shadowColor = lightShadowColor.cgColor
        lightInnerShadow.shadowOffset = CGSize(width: shadowRadius, height: shadowRadius)
        lightInnerShadow.shadowRadius = shadowRadius
        lightInnerShadow.shadowOpacity = shadowOpacity
        innerShadowLayer.addSublayer(lightInnerShadow)
        
        // (top-left)
        let darkInnerShadow = CALayer()
        darkInnerShadow.frame = bounds
        darkInnerShadow.shadowColor = darkShadowColor.cgColor
        darkInnerShadow.shadowOffset = CGSize(width: -shadowRadius, height: -shadowRadius)
        darkInnerShadow.shadowRadius = shadowRadius
        darkInnerShadow.shadowOpacity = shadowOpacity
        innerShadowLayer.addSublayer(darkInnerShadow)
        
        layer.addSublayer(innerShadowLayer)
        
        self.layer.borderColor = backgroundColor.darker(by: 5)?.cgColor ?? darkShadowColor.cgColor
        self.layer.borderWidth = 0.5
    }
    
    func addShadow(opecity: Float, size: Double, radius: Double, color: UIColor ) {
        layer.shadowColor = color.cgColor
        layer.shadowOpacity = opecity
        layer.shadowOffset = CGSize(width: size, height: size)
        layer.shadowRadius = radius
        layer.masksToBounds = true
    }
}
