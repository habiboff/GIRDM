//
//  AppRoute.swift
//  CatCats
//
//  Created by Nahit Habibov on 10.11.24.
//

import UIKit

class AppRoute: BaseRoute {
    
    private var window: UIWindow
    
    init(window: UIWindow) {
        self.window = window
        self.window.rootViewController = appNavigationController
        self.window.makeKeyAndVisible()
        super.init(navigationController: appNavigationController)
    }
    
    private var appNavigationController: UINavigationController = {
        let nc = UINavigationController()
        return nc
    }()
    
    override func start() {
        showRootController()
    }
    
    private func showRootController() {
        let tabBarRout = MainRoute(navigationController: navigationController)
        tabBarRout.start()
    }
}
