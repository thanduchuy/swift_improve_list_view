//
//  AppNavigator.swift
//  ImproveListApp
//
//  Created by than.duc.huy on 7/7/25.
//

import UIKit

protocol AppNavigatorType {
    func toMain()
}

struct AppNavigator: AppNavigatorType {
    unowned let window: UIWindow
    
    func toMain() {
        let nav = UINavigationController()
        let vc = MainViewController.initView(navigation: nav)
        nav.viewControllers.append(vc)
        window.rootViewController = nav
        window.makeKeyAndVisible()
    }
}
