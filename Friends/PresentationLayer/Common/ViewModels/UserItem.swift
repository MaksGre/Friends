//
//  UserItem.swift
//  Friends
//
//  Created by Maksim Grebenozhko on 23/09/2019.
//  Copyright © 2019 Maksim Grebenozhko. All rights reserved.
//

import Foundation

struct UserItem {
    var id: Int
    var name: String
    var email: String
    var isActive: Bool
        
    init(user: RealmUser) {
        self.id = user.id
        self.name = user.name
        self.email = user.email
        self.isActive = user.isActive
    }
}
