//
//  MainViewController.swift
//  ImproveListApp
//
//  Created by than.duc.huy on 7/7/25.
//

import Combine
import CombineCocoa
import UIKit

final class MainViewController: BaseViewController, Bindable {
    
    @IBOutlet private weak var bottomSheetView: UIView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var defaultListButton: UIButton!
    
    var viewModel: MainViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configTitle()
        configBottomSheet()
        configButton()
    }
    
    private func configTitle() {
        titleLabel.font = UIFont.getDefaultFont(size: 24, isBold: true)
        titleLabel.text = "DEMO - Improve List <3"
    }
    
    private func configBottomSheet() {
        bottomSheetView.applyDiagonalGradient(colors: [.black222834, .black353F54], cornerRadius: 0)
        bottomSheetView.roundCorners(corners: [.topLeft, .topRight], radius: 32)
    }
    
    private func configButton() {
        defaultListButton.titleLabel?.font = UIFont.getDefaultFont(size: 14, isBold: true)
        defaultListButton.titleLabel?.textColor = .blue3CA4EB
        defaultListButton.embossedNeumorphism(
            cornerRadius: 16,
            backgroundColor: .black323B4F,
            lightShadowColor: .black38445A,
            darkShadowColor: .black252B39,
            shadowRadius: 8,
            shadowOpacity: 1.0
        )
    }
    
    func bindViewModel() {
        let input = MainViewModel.Input(toDefaultList: defaultListButton.tapPublisher.asDriver())
        
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
