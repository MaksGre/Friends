//
//  MainRouter.swift
//  Friends
//
//  Created by Maksim Grebenozhko on 23/09/2019.
//  Copyright © 2019 Maksim Grebenozhko. All rights reserved.
//

import UIKit

// MARK: - Router

protocol MainRouter: AnyObject {
    func showUserDetails(_ user: RealmUser)
}

// MARK: - RouterImpl

final class MainRouterImpl: MainRouter {
    
    weak var viewController: UIViewController?
    
    func showUserDetails(_ user: RealmUser) {
        let vc = DetailsAssembly.createModule()
        vc.user = DetailsItem(user: user)
        viewController?.show(vc, sender: self)
    }
}
