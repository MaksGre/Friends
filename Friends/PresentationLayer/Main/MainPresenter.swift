//
//  MainPresenter.swift
//  Friends
//
//  Created by Maksim Grebenozhko on 20/09/2019.
//  Copyright © 2019 Maksim Grebenozhko. All rights reserved.
//

import Foundation

// MARK: - Presenter

protocol  MainPresenter: AnyObject {
    func didTriggerViewReadyEvent()
    func didSelectRow(index: Int)
}

// MARK: - PresenterImpl

final class MainPresenterImpl: MainPresenter {
    
    private weak var view: MainView?
    private let interactor: MainInteractor
    private let router: MainRouter
    
    // MARK: - Init
    
    init(view: MainView, interactor: MainInteractor, router: MainRouter) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    // MARK: - MainPresenter
    
    func didTriggerViewReadyEvent() {
        interactor.loadAndCheckData()
        interactor.subscribeOnUsers { [weak self] users in
            //let userItems = users.map {UserItem(user: $0)}
            var userItems: [UserItem] = []
            for user in users {
                let userItem = UserItem()
                userItem.name = user.name
                userItem.email = user.email
                userItem.isActive = user.isActive
                userItems.append(userItem)
            }
            self?.view?.users = userItems
            self?.view?.reloadData()
        }
    }
    
    func didSelectRow(index: Int) {
        router.showUserDetails(index: index)
    }
    
}
