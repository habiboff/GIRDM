//
//  MainViewModel.swift
//  GIRDM
//
//  Created by Nahit Habibov on 13.11.24.
//

import Foundation

class MainViewModel: BaseViewModel<MainRoute, EmptRepo> {
    
    private var mainName: String = ""
    
    func loadName(name: String) {
        self.mainName = name
    }
    
    func showDetail(name: String) {
        router.showDetail(name: name)
    }
}
