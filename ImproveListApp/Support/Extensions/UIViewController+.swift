//
//  UIViewController+.swift
//  ImproveListApp
//
//  Created by than.duc.huy on 10/7/25.
//

import UIKit
import MBProgressHUD

extension UIViewController {
    public func logDeinit() {
        Logger.debug(String(describing: type(of: self)) + " deinit")
    }
    
    var subscribeOnLoading: (Bool) -> Void {
        return { [weak self] isLoading in
            guard let self = self else { return }
            if isLoading {
                self.showLoadingInWindow(view: self.view)
            } else {
                self.hideLoadingForWindow(view: self.view)
            }
        }
    }
    
    func showLoadingInView(_ view: UIView, animated: Bool = true) {
        let hud = MBProgressHUD.showAdded(to: view, animated: animated)
        hud.backgroundView.color = .black38445A
    }
    
    func showLoadingInWindow(view: UIView, animated: Bool = true) {
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let sceneDelegate = windowScene.delegate as? SceneDelegate,
              let window = sceneDelegate.window else {
            showLoadingInView(view, animated: animated)
            return
        }
        let hud = MBProgressHUD.showAdded(to: window, animated: animated)
        hud.backgroundView.color = .black38445A
    }
    
    func hideLoadingForView(_ view: UIView, animated: Bool = true) {
        MBProgressHUD.hide(for: view, animated: animated)
    }
    
    func hideLoadingForWindow(view: UIView, animated: Bool = true) {
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene,
              let sceneDelegate = windowScene.delegate as? SceneDelegate,
              let window = sceneDelegate.window else {
            hideLoadingForView(view, animated: animated)
            return
        }
        MBProgressHUD.hide(for: window, animated: animated)
    }
}
