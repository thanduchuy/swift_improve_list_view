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
    
    func configNavigationBar(tintColor: UIColor? = .white,
                             title: String? = nil,) {
        let navigationBarAppearace = UINavigationBar.appearance()
        navigationBarAppearace.tintColor = tintColor
        if let title {
            let titleLabel = UILabel()
            titleLabel.textColor = .black222834
            titleLabel.font = UIFont.getDefaultFont(size: 20, isBold: true)
            titleLabel.text = title
            navigationItem.titleView = titleLabel
        }
        if #available(iOS 15, *) {
            let appearance = UINavigationBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.titleTextAttributes = [.foregroundColor: UIColor.white]
            let proxy = UINavigationBar.appearance()
            proxy.tintColor = tintColor
            UINavigationBar.appearance().standardAppearance = appearance
            UINavigationBar.appearance().scrollEdgeAppearance = appearance
        }
    }
    
    func configBackButton(tintColor: UIColor? = nil) {
        let item = UIBarButtonItem(image: R.image.ic_back(),
                                   style: .plain,
                                   target: self,
                                   action: #selector(backAction))
        item.tintColor = .black202633
        item.imageInsets.left = 7
        navigationItem.setLeftBarButton(item, animated: false)
    }
    
    @objc
    func backAction() {
        navigationController?.popViewController(animated: true)
    }
}

extension BaseViewController: UIGestureRecognizerDelegate {
    func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool {
        return canGoBackBySwipe
    }
}
