//
//  DetailsAssembly.swift
//  Friends
//
//  Created Maksim Grebenozhko on 29/09/2019.
//  Copyright © 2019 Maksim Grebenozhko. All rights reserved.
//

import UIKit

final class DetailsAssembly {

    static func createModule(user: RealmUser) -> DetailsViewController {
        let view = DetailsViewController()
        let interactor = DetailsInteractorImpl(storageService: StorageServiceImpl())
        let router = DetailsRouterImpl()
        let presenter = DetailsPresenterImpl(view: view, interactor: interactor, router: router, user: user)

        view.presenter = presenter
        router.viewController = view

        return view
    }
}
