//
//  UIViewController+.swift
//  ImproveListApp
//
//  Created by than.duc.huy on 10/7/25.
//

import UIKit

extension UIViewController {
    public func logDeinit() {
        Logger.debug(String(describing: type(of: self)) + " deinit")
    }
}
