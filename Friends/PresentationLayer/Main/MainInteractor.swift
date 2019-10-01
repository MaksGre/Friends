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
    func loadSelectedUserBy(_ id: Int) -> RealmUser?
    func refreshData(completion: @escaping () -> Void)
}

// MARK: - InteractorImpl

final class MainInteractorImpl: MainInteractor {

    private enum Constants {
        static let dataLifeTime = 300
    }

    private var reloadWorkItem: DispatchWorkItem?
    private let networkService: NetworkService
    private let storageService: StorageService

    // MARK: - Lifecycle

    init(networkService: NetworkService, storageService: StorageService) {
        self.networkService = networkService
        self.storageService = storageService
    }
    
    deinit {
        storageService.unsubscribeFromUsers()
    }
    
    // MARK: - MainInteractor
    
    func subscribeOnUsers(completion: @escaping (Results<RealmUser>) -> Void) {
        storageService.subscribeOnUsers(completion: completion)
    }
    
    func loadAndCheckData() {
        if let lastUpdateDate = storageService.getLastUpdateDate() {
            let timeInterval = Int(Date().timeIntervalSince(lastUpdateDate))
            if timeInterval > Constants.dataLifeTime {
                loadUsers()
            } else {
                self.dispatchLoadUsers(after: timeInterval)
            }
        } else {
            loadUsers()
        }
    }
    
    func loadSelectedUserBy(_ id: Int) -> RealmUser? {
        return storageService.loadUser(id: id)
    }

    func refreshData(completion: @escaping () -> Void) {
        reloadWorkItem?.cancel()
        loadUsers(completion: completion)
    }

    // MARK: - Private functions
    
    private func loadUsers(completion: (() -> Void)? = nil) {
        networkService.fetchUsers { [weak self] users in
            guard let self = self else { return }
            switch users {
            case .success(let users):
                self.storageService.store(users: users.map { RealmUser(user: $0) })
                self.storageService.storeLastUpdateDate(date: Date())
            case .failure(let error):
                print(error)
            }
            self.dispatchLoadUsers(after: Constants.dataLifeTime)
            completion?()
        }
    }

    private func dispatchLoadUsers(after seconds: Int) {
        let item = DispatchWorkItem { [weak self] in
            self?.loadUsers()
        }
        reloadWorkItem = item
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(seconds), execute: item)
    }
}
