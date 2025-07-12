//
//  SceneDelegate.swift
//  ImproveListApp
//
//  Created by than.duc.huy on 7/7/25.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    var window: UIWindow?
    var cancelBag = CancelBag()
    
    func scene(_ scene: UIScene,
               willConnectTo session: UISceneSession,
               options connectionOptions: UIScene.ConnectionOptions) {
        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            self.window = window
            let navigator = AppNavigator(window: window)
            let vm = AppViewModel(navigator: navigator)
            let input = AppViewModel.Input(loadTrigger: Driver.just(()))
            _ = vm.transform(input, cancelBag: cancelBag)
        }
    }
}
