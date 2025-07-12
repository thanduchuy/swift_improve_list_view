//
//  MainViewController.swift
//  ImproveListApp
//
//  Created by than.duc.huy on 7/7/25.
//

import Combine
import UIKit

final class MainViewController: BaseViewController, Bindable {
    
    var viewModel: MainViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func bindViewModel() {
        let input = MainViewModel.Input(loadTrigger: .just(()))
        
        _ = viewModel.transform(input, cancelBag: cancelBag)
    }
}

// Init View

extension MainViewController {
    static func initView(navigation: UINavigationController) -> MainViewController {
        let navigator = MainNavigator(navigationController: navigation)
        let vm = MainViewModel(navigator: navigator)
        let vc = R.storyboard.top.instantiateInitialViewController() ?? MainViewController()
        vc.bindViewModel(to: vm)
        return vc
    }
}
