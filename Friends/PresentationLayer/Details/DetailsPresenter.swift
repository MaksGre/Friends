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
            DetailsItem(title: "Balance:",        textType: .plain(user.balance.discardUnwantedPart())),
            DetailsItem(title: "Age:",            textType: .plain(String(user.age))),
            DetailsItem(title: "Eye Color:",      textType: .attributed(user.eyeColor.colorDot)),
            DetailsItem(title: "Company:",        textType: .plain(user.company)),
            DetailsItem(title: "Email:",          textType: .plain(user.email), didSeletectItem: { [weak self] _ in
                self?.send(email: self?.user.email) }),
            DetailsItem(title: "Phone:",          textType: .plain(user.phone), didSeletectItem: { [weak self] _ in
                self?.callPhone(number: self?.user.phone) }),
            DetailsItem(title: "Address:",        textType: .plain(user.address)),
            DetailsItem(title: "About:",          textType: .plain(user.about)),
            DetailsItem(title: "Registered:",     textType: .plain(user.registered.dateInDesiredFormat())),
            DetailsItem(title: "Coordinates:",    textType: .plain(user.coordinates), didSeletectItem: { [weak self] _ in
                self?.showMap(coordinates: self?.user.coordinates) }),
            DetailsItem(title: "Favorite Fruit:", textType: .plain(user.favoriteFruit.emoji)),
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
        view?.reloadData(navigationItemTitle: user.name, sections: sections)
    }

    // MARK: - Private functions

    private func callPhone(number: String?) {
        guard let number = number else { return }
        interactor.callTo(subscriber: number)
    }

    private func send(email: String?) {
        guard let email = email else { return }
        interactor.openEmailClient(recipient: email)
    }

    private func showMap(coordinates: String?) {
        guard let coordinates = coordinates else { return }
        interactor.openMap(coordinates: coordinates)
    }

    private func showUserDetailsInfo(_ item: UserDetailsItem) {
        guard let item = item as? UserItem, item.isActive, let user = interactor.loadUser(id: item.id) else {
            return
        }
        router.showUserDetails(user)
    }
}
