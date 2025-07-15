//
//  MainNavigator.swift
//  ImproveListApp
//
//  Created by than.duc.huy on 7/7/25.
//

import UIKit

protocol MainNavigatorType {
    func toDefaultList()
}

struct MainNavigator: MainNavigatorType {
    unowned let navigationController: UINavigationController
    
    func toDefaultList() {
        let vc = DefaultListViewController.initView(navigation: navigationController)
        navigationController.pushViewController(vc, animated: true)
    }
}
