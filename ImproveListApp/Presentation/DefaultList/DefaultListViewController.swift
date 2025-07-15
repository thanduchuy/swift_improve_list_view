//
//  DefaultListViewController.swift
//  ImproveListApp
//
//  Created by than.duc.huy on 14/7/25.
//

import Combine
import UIKit

final class DefaultListViewController: BaseViewController, Bindable {
    
    var viewModel: DefaultListViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configBackButton()
        configNavigationBar(title: "Default List")
    }
    
    func bindViewModel() {
        let input = DefaultListViewModel.Input(loadTrigger: .just(()))
        
        let output = viewModel.transform(input, cancelBag: cancelBag)
        
        output.$isLoading.sink(subscribeOnLoading, cancelBag: cancelBag)
    }
}

// Init View

extension DefaultListViewController {
    static func initView(navigation: UINavigationController) -> DefaultListViewController {
        let navigator = DefaultListNavigator(navigationController: navigation)
        let vm = DefaultListViewModel(navigator: navigator)
        let vc = R.storyboard.defaultList.instantiateInitialViewController() ?? DefaultListViewController()
        vc.bindViewModel(to: vm)
        return vc
    }
}
