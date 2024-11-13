//
//  SceneDelegate.swift
//  GIRDM
//
//  Created by Nahit Habibov on 13.11.24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    var appRoute: AppRoute?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
 
        guard let windowScene = (scene as? UIWindowScene) else { return }
        self.window = UIWindow(windowScene: windowScene)
        if let window {
            appRoute = AppRoute(window: window)
            appRoute?.start()
        }
    }
}

