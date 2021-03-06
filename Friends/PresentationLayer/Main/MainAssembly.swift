//
//  MainAssembly.swift
//  Friends
//
//  Created by Maksim Grebenozhko on 20/09/2019.
//  Copyright © 2019 Maksim Grebenozhko. All rights reserved.
//

import UIKit

final class MainAssembly {
    
    static func createModule() -> UIViewController {
        let view = MainViewController()
        let interactor = MainInteractorImpl(networkService: NetworkServiceImpl(), storageService: StorageServiceImpl())
        let router = MainRouterImpl()
        let presenter = MainPresenterImpl(view: view, interactor: interactor, router: router)
        
        view.presenter = presenter
        router.viewController = view
        
        return view
    }
}
