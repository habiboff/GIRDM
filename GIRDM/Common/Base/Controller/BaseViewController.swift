//
//  BaseViewController.swift
//  CatCats
//
//  Created by Nahit Habibov on 10.11.24.
//

import UIKit

class BaseViewController<VM>: UIViewController {
    
    private(set) var viewModel: VM
    
    init(viewModel: VM) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
        
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.setupLocalize()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupComponents()
        setupConstraints()
    }
    
    func setupLocalize() {}
    
    func setupComponents() {}
    
    func setupConstraints() {}
}
