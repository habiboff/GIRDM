//
//  ViewController.swift
//  GIRDM
//
//  Created by Nahit Habibov on 13.11.24.
//

import UIKit

class MainViewController: BaseViewController<MainViewModel> {
    
    private lazy var showDetailButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Open Detail", for: .normal)
        button.addTarget(self, action: #selector(didTapOpenDetail), for: .touchUpInside)
        return button
    }()

    override func setupLocalize() {
        super.setupLocalize()
        title = "Main"
    }
    
    override func setupComponents() {
        super.setupComponents()
//        view.backgroundColor = .red
    }
    
    override func setupConstraints() {
        super.setupConstraints()
        view.addSubview(showDetailButton)
        showDetailButton.frame = CGRect(x: 0, y: 0, width: 100, height: 40)
        showDetailButton.center = view.center
    }

    @objc private func didTapOpenDetail() {
        viewModel.showDetail(name: "My App")
    }
}

