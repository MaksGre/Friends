//
//  DetailsPresenter.swift
//  Friends
//
//  Created Maksim Grebenozhko on 29/09/2019.
//  Copyright © 2019 Maksim Grebenozhko. All rights reserved.
//

import Foundation

protocol DetailsPresenter: AnyObject {
    func didTriggerViewDidLoad()
}

final class DetailsPresenterImpl: DetailsPresenter {

    weak var view: DetailsView?
    var interactor: DetailsInteractor
    let router: DetailsRouter

    // MARK: - Init

    init(view: DetailsView, interactor: DetailsInteractor, router: DetailsRouter) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }

    // MARK: - DetailsPresenter

    func didTriggerViewDidLoad() {
        
    }
}
