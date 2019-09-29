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
    func showUserDetails(index: Int)
}

// MARK: - RouterImpl

final class MainRouterImpl: MainRouter {
    
    weak var viewController: UIViewController?
    
    func showUserDetails(index: Int) {
        let vc = DetailsAssembly.createModule()
        viewController?.show(vc, sender: self)
    }
}
