//
//  BindableType.swift
//  ImproveListApp
//
//  Created by than.duc.huy on 7/7/25.
//

import UIKit

public protocol Bindable: AnyObject {
    associatedtype ViewModelType
    
    var viewModel: ViewModelType! { get set }
    
    func bindViewModel()
}

extension Bindable where Self: UIViewController {
    public func bindViewModel(to model: Self.ViewModelType) {
        viewModel = model
        loadViewIfNeeded()
        bindViewModel()
    }
}
