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
    func didSelectUserById(id: Int)
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
            self?.view?.users =  users.map { UserItem(user: $0) }
            self?.view?.reloadData()
        }
    }
    
    func didSelectUserById(id: Int) {
        guard let user = interactor.loadSelectedUserBy(id) else { return }
        router.showUserDetails(user)
    }
    
}
