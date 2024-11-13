//
//  BaseRoute.swift
//  CatCats
//
//  Created by Nahit Habibov on 10.11.24.
//

import UIKit

class BaseRoute: Route {
    
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        fatalError("Child should implement func start method")
    }
}
