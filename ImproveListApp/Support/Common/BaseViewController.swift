//
//  BaseViewController.swift
//  ImproveListApp
//
//  Created by than.duc.huy on 10/7/25.
//

import Combine
import UIKit

class BaseViewController: UIViewController {  // swiftlint:disable:this final_class
    
    // MARK: - Properties
    var cancelBag = CancelBag()
    
    // MARK: - UI Compoments
    
    var canGoBackBySwipe: Bool {
        return true
    }
    
    // MARK: - Deinit
    
    deinit {
        logDeinit()
    }

    // MARK: - Methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func configView() {
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if (navigationController?.viewControllers.count ?? 0) > 1 {
            navigationController?.interactivePopGestureRecognizer?.delegate = self
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.interactivePopGestureRecognizer?.delegate = nil
    }
}

extension BaseViewController: UIGestureRecognizerDelegate {
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return canGoBackBySwipe
    }
}
