//
//  MainInteractor.swift
//  Friends
//
//  Created by Maksim Grebenozhko on 20/09/2019.
//  Copyright © 2019 Maksim Grebenozhko. All rights reserved.
//

import Foundation

typealias UserHandler = (User) -> Void
typealias FriendsHandler = (User) -> Void

// MARK: - Interactor

protocol MainInteractor: AnyObject {
    func subscribeOnUsers(handler: @escaping FriendsHandler)
    func loadData()
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
    
    func loadData() {
        networkService.fetchUsers { users in
            switch users {
            case .success(let value): UserItem.users = value
            case .failure(let error): print(error)
            }
        }
    }
}
