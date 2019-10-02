//
//  DetailsPresenter.swift
//  Friends
//
//  Created Maksim Grebenozhko on 29/09/2019.
//  Copyright © 2019 Maksim Grebenozhko. All rights reserved.
//

import UIKit

protocol DetailsPresenter: AnyObject {
    func didTriggerViewDidLoad()
}

final class DetailsPresenterImpl: DetailsPresenter {

    private weak var view: DetailsView?
    private let interactor: DetailsInteractor
    private let router: DetailsRouter
    private let user: RealmUser
    private var sections: [UserDetailsSection] = []

    // MARK: - Init

    init(view: DetailsView, interactor: DetailsInteractor, router: DetailsRouter, user: RealmUser) {
        self.view = view
        self.interactor = interactor
        self.router = router
        self.user = user
    }

    // MARK: - DetailsPresenter

    func didTriggerViewDidLoad() {

        let infoItems: [UserDetailsItem] = [
            DetailsItem(title: "Balance:",        value: user.balance.discardUnwantedPart(),           didSeletectItem: nil),
            DetailsItem(title: "Age:",            value: String(user.age),       didSeletectItem: nil),
            DetailsItem(title: "Eye Color:",      value: user.eyeColor.rawValue, didSeletectItem: nil),
            DetailsItem(title: "Name:",           value: user.name,              didSeletectItem: nil),
            DetailsItem(title: "Company:",        value: user.company,           didSeletectItem: nil),
            DetailsItem(title: "Email:",          value: user.email,             didSeletectItem: { [weak self] _ in
                self?.send(email: self?.user.email)
            }),
            DetailsItem(title: "Phone:",          value: user.phone,             didSeletectItem: { [weak self] _ in
                self?.callPhone(number: self?.user.phone)
            }),
            DetailsItem(title: "Address:",        value: user.address,           didSeletectItem: nil),
            DetailsItem(title: "About:",          value: user.about,             didSeletectItem: nil),
            DetailsItem(title: "Registered:",     value: user.registered.dateInDesiredFormat(),        didSeletectItem: nil),
            DetailsItem(title: "Coordinates:",    value: getCoordinates(),       didSeletectItem: { [weak self] _ in
                self?.showMap()
            }),
            DetailsItem(title: "Favorite Fruit:", value: user.favoriteFruit.emoji, didSeletectItem: nil),
            TagsItem(tags: user.tags.map { $0 }, didSeletectItem: nil)
        ]

        let infoSection = UserDetailsSection(title: nil, items: infoItems)

        let friendItems: [UserItem] = user.friends
            .compactMap {
                return self.interactor.loadUser(id: $0)
            }
            .map {
                return UserItem(user: $0) { [weak self] item in
                    self?.showUserDetailsInfo(item)
                }
        }

        let friendsSection = UserDetailsSection(title: "Friends", items: friendItems)

        sections = [infoSection, friendsSection]
        view?.reloadData(sections: sections)
    }

    // MARK: - Private functions

    private func getCoordinates() -> String {
        return ""
    }

    private func callPhone(number: String?) {
        guard let number = number else { return }
        interactor.callTo(subscriber: number)
    }

    private func send(email: String?) {
        guard let email = email else { return }
        interactor.openEmailClient(recipient: email)
    }

    private func showMap() {

    }

    private func showUserDetailsInfo(_ item: UserDetailsItem) {
        guard let item = item as? UserItem, item.isActive, let user = interactor.loadUser(id: item.id) else {
            return
        }
        router.showUserDetails(user)
    }
}
