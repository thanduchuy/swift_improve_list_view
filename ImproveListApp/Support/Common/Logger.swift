//
//  Logger.swift
//  ImproveListApp
//
//  Created by than.duc.huy on 10/7/25.
//

import UIKit

enum Logger {
    static func debug(_ message: String, function: String = #function) {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm:ss"
        let date = formatter.string(from: NSDate() as Date)
        print("\(date) Func: \(function) : \(message)")
    }
}
