//
//  DetailsRouter.swift
//  Friends
//
//  Created Maksim Grebenozhko on 29/09/2019.
//  Copyright © 2019 Maksim Grebenozhko. All rights reserved.
//

import UIKit

protocol DetailsRouter: AnyObject {
    func dismissView()
}

final class DetailsRouterImpl: DetailsRouter {

    weak var viewController: UIViewController?

    private let serviceLocator: ServiceLocator

    init(serviceLocator: ServiceLocator) {
        self.serviceLocator = serviceLocator
    }

    // MARK: - DetailsRouter

    func dismissView() {

    }
}
