//
//  MainInteractor.swift
//  Friends
//
//  Created by Maksim Grebenozhko on 20/09/2019.
//  Copyright © 2019 Maksim Grebenozhko. All rights reserved.
//

import Foundation
import RealmSwift

// MARK: - Interactor

protocol MainInteractor: AnyObject {
    func subscribeOnUsers(completion: @escaping (Results<RealmUser>) -> Void)
    func loadAndCheckData()
    func loadSelectedUser(index: Int) -> User
}

// MARK: - InteractorImpl

final class MainInteractorImpl: MainInteractor {

    private enum Constants {
        static let dataLifeTime = 300
    }
    
    private let networkService: NetworkService
    
    private let storageService: StorageService
    
    init(networkService: NetworkService, storageService: StorageService) {
        self.networkService = networkService
        self.storageService = storageService
    }
    
    deinit {
        storageService.unsubscribe()
    }
    
    // MARK: - MainInteractor
    
    func subscribeOnUsers(completion: @escaping (Results<RealmUser>) -> Void) {
        storageService.subscribe(completion: completion)
    }
    
    func loadAndCheckData() {
        if let lastUpdateDate = storageService.getLastUpdateDate() {
            let timeInterval = Int(Date().timeIntervalSince(lastUpdateDate))
            if timeInterval > Constants.dataLifeTime {
                loadUsers()
            } else {
                DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(timeInterval)) {
                    [weak self] in
                    self?.loadUsers()
                }
            }
        } else {
            loadUsers()
        }
    }
    
    func loadSelectedUser(index: Int) -> User {
        return User()
    }
    
    // MARK: - Private functions
    
    private func loadUsers() {
        networkService.fetchUsers { [weak self] users in
            guard let self = self else { return }
            switch users {
            case .success(let users):
                self.storageService.store(users: users.map { RealmUser(user: $0) })
                self.storageService.storeLastUpdateDate(date: Date())
            case .failure(let error):
                print(error)
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(Constants.dataLifeTime)) { [weak self] in
                self?.loadUsers()
            }
        }
    }
    
}
