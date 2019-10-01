//
//  DetailsRouter.swift
//  Friends
//
//  Created Maksim Grebenozhko on 29/09/2019.
//  Copyright © 2019 Maksim Grebenozhko. All rights reserved.
//

import UIKit

protocol DetailsRouter: AnyObject {
    func showUserDetails(_ user: RealmUser)
}

// MARK: - DetailsRouter

final class DetailsRouterImpl: DetailsRouter {

    weak var viewController: UIViewController?

    func showUserDetails(_ user: RealmUser) {
        let vc = DetailsAssembly.createModule(user: user)
        viewController?.show(vc, sender: self)
    }
}
