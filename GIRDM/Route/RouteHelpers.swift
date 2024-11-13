//
//  RouteHelpers.swift
//  CatCats
//
//  Created by Nahit Habibov on 11.11.24.
//

import UIKit

enum BottomSheet {
    case medium
    case large
    case mediumLarge
    case custom(CGFloat)
}

enum Transiotion {
    case rootViewController(UIViewController)
    case push(UIViewController)
    case present(UIViewController, UIModalPresentationStyle)
    case navitionPresent(UIViewController, UIModalPresentationStyle)
}

extension BaseRoute {
    private func getKeyWindow() -> UIWindow? {
        return UIApplication.shared
            .connectedScenes
            .compactMap { $0 as? UIWindowScene }
            .flatMap { $0.windows }
            .first { $0.isKeyWindow }
    }
        
    func show(type: Transiotion) {
        switch type {
        case .rootViewController(let viewController):
            guard let window = getKeyWindow() else { return }
            window.rootViewController = viewController
            window.makeKeyAndVisible()
        case .push(let viewController):
            viewController.hidesBottomBarWhenPushed = true
            navigationController.show(viewController, sender: self)
        case .present(let viewController, let style):
            viewController.modalPresentationStyle = style
            navigationController.present(viewController, animated: true)
        case .navitionPresent(let viewController, let style):
            let nc = UINavigationController(rootViewController: viewController)
            nc.modalPresentationStyle = style
            navigationController.present(nc, animated: true)
        }
    }
    
    func sheetPresent(vc: UIViewController, type: BottomSheet) {
        vc.modalPresentationStyle = .pageSheet
        if let sheet = vc.sheetPresentationController {
            switch type {
            case .medium:
                sheet.detents = [.medium()]
            case .large:
                sheet.detents = [.large()]
            case .mediumLarge:
                sheet.detents = [.medium(), .large()]
            case .custom(let value):
                sheet.detents = [.custom(resolver: { _ in
                    return value
                })]
            }
        }
        navigationController.present(vc, animated: true)
    }
}
