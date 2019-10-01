//
//  DetailsInteractor.swift
//  Friends
//
//  Created Maksim Grebenozhko on 29/09/2019.
//  Copyright © 2019 Maksim Grebenozhko. All rights reserved.
//

import UIKit

protocol DetailsInteractor: AnyObject {
    func loadUser(id: Int) -> RealmUser?
    func openEmailClient(recipient: String)
    func callTo(subscriber: String)
}

final class DetailsInteractorImpl: DetailsInteractor {

    private let storageService: StorageService

    // MARK: - Lifecycle

    init(storageService: StorageService) {
        self.storageService = storageService
    }

    // MARK: - DetailsInteractor

    func loadUser(id: Int) -> RealmUser? {
        return storageService.loadUser(id: id)
    }
    
    func openEmailClient(recipient: String) {
        guard let url = URL(string: "mailto:\(recipient)") else { return }
        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
    
    func callTo(subscriber: String) {
        //guard let url = URL(string: "tel:\(subscriber)") else { return }
        print(URL(string: "tel:+79277136445")!)
        print(URL(string: "tel:+19694073505")!)
        guard let url = URL(string: "tel:+19694073505") else { return }
        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url, options: [:], completionHandler: nil)
        }
    }
}
