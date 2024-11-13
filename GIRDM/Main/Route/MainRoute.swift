//
//  MainRoute.swift
//  GIRDM
//
//  Created by Nahit Habibov on 13.11.24.
//

import UIKit

class MainRoute: BaseRoute {
    
    override func start() {
        let vc = MainViewController(viewModel: MainViewModel(router: self))
        navigationController.viewControllers = [vc]
    }
    
    func showDetail(name: String) {
        let vc = DetailViewController(viewModel: DetailViewModel(router: DetailRoute(navigationController: navigationController)))
        show(type: .push(vc))
    }
}
