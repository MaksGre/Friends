//
//  MainInteractor.swift
//  Friends
//
//  Created by Maksim Grebenozhko on 20/09/2019.
//  Copyright © 2019 Maksim Grebenozhko. All rights reserved.
//

import Foundation

typealias UserHandler = (User) -> Void

// MARK: - Interactor

protocol MainInteractor: AnyObject {
    func subscribeOnUsers(handler: @escaping FriendsHandler)
}

// MARK: - InteractorImpl

final class MainInteractorImpl: MainInteractor {
    
    private let networkService: NetworkService
    
    init(networkService: NetworkService) {
        self.networkService = networkService
        // process users lifetime here
    }
    
    // MARK: - MainInteractor
    
    func subscribeOnUsers(handler: @escaping UserHandler) {
        //.. subscribe on realm
    }
}
