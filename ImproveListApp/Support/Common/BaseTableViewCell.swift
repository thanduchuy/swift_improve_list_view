//
//  BaseTableViewCell.swift
//  ImproveListApp
//
//  Created by than.duc.huy on 14/7/25.
//

import UIKit
import Combine

class BaseTableViewCell: UITableViewCell {
    var cancelBag = CancelBag()
    
    override func prepareForReuse() {
        super.prepareForReuse()
        cancelBag.cancel()
        cancelBag = CancelBag()
    }
}
