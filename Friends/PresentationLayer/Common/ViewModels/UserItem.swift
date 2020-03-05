//
//  UserItem.swift
//  Friends
//
//  Created by Maksim Grebenozhko on 23/09/2019.
//  Copyright © 2019 Maksim Grebenozhko. All rights reserved.
//

import UIKit

struct UserItem: UserDetailsItem {
    var id: Int
    var name: String
    var email: String
    var isActive: Bool
    var active: String {
        return isActive ? "✔︎" : "✘"
    }
        
    init(user: RealmUser, didSeletectItem: ((UserDetailsItem) -> Void)? = nil) {
        self.id = user.id
        self.name = user.name
        self.email = user.email
        self.isActive = user.isActive
        self.didSeletectItem = didSeletectItem
    }

    var didSeletectItem: ((UserDetailsItem) -> Void)?

    let CellType: (UITableViewCell & UserDetailsCell).Type = MainTableViewCell.self
}
