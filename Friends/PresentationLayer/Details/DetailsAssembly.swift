//
//  DetailsAssembly.swift
//  Friends
//
//  Created Maksim Grebenozhko on 29/09/2019.
//  Copyright © 2019 Maksim Grebenozhko. All rights reserved.
//

import UIKit

final class DetailsAssembly {

    static func createModule(serviceLocator: ServiceLocator) -> UIViewController {
        let view = DetailsViewController()
        let interactor = DetailsInteractorImpl()
        let router = DetailsRouterImpl(serviceLocator: serviceLocator)
        let state = DetailsState()
        let presenter = DetailsPresenterImpl(view: view,
                                             interactor: interactor,
                                             router: router,
                                             state: state)

        view.presenter = presenter
        interactor.output = presenter
        router.viewController = view

        return view
    }
}
