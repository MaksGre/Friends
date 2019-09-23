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
    func showUserDetails()
}

// MARK: - RouterImpl

final class MainRouterImpl: MainRouter {
    
    weak var viewController: UIViewController?
    
    // MARK: -
    
    func showUserDetails() {
        
    }
}
