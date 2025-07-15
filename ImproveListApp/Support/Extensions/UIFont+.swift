//
//  UIFont+.swift
//  ImproveListApp
//
//  Created by than.duc.huy on 14/7/25.
//

import Foundation
import UIKit

extension UIFont {
    static func getDefaultFont(size: CGFloat, isBold: Bool) -> UIFont {
        let font = isBold ? R.font.poppinsBold(size: size) : R.font.poppinsRegular(size: size)
        if let font {
            return font
        } else {
            return isBold ? .systemFont(ofSize: size, weight: .bold) : .systemFont(ofSize: size)
        }
    }
}
