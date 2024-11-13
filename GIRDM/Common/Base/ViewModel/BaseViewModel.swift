//
//  BaseViewModel.swift
//  CatCats
//
//  Created by Nahit Habibov on 10.11.24.
//

import Foundation

enum BaseData<T> {
    case data(T)
}

protocol LoadingDelegate {
    var isLoading: Observable<Bool> { get }
}

protocol BaseRepository {}

class EmptRepo: BaseRepository {}

class BaseViewModel<Router: Route, Repo: BaseRepository>: LoadingDelegate {
    var isLoading: Observable<Bool> = Observable<Bool>.init(false)
    private var data: [BaseData<Any>] = []
    
    private(set) var router: Router
    private(set) var repository: Repo
    
    init(router: Router, repository: Repo = EmptRepo()) {
        self.router = router
        self.repository = repository
    }
    
    func set(item: BaseData<Any>) {
        self.data.append(item)
    }
    
    func bind<T>() -> T? {
        for item in data {
            switch item {
            case .data(let t):
                if let dataType = t as? T {
                    return dataType
                }
            }
        }
        
        return nil
    }
    
    func bind<T>(completion: @escaping(T) -> Void) {
        for item in data {
            switch item {
            case .data(let t):
                if let dataType = t as? T {
                    completion(dataType)
                }
            }
        }
    }
    
    func start() {
        DispatchQueue.main.async {
            self.isLoading.value = true
        }
    }
    
    func stop() {
        DispatchQueue.main.async {
            self.isLoading.value = false
        }
    }
}
