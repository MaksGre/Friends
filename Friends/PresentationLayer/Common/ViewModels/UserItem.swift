//
//  UserItem.swift
//  Friends
//
//  Created by Maksim Grebenozhko on 23/09/2019.
//  Copyright © 2019 Maksim Grebenozhko. All rights reserved.
//

import Foundation

class UserItem {
    var name = ""
    var email = ""
    var isActive = false
        
    convenience init(user: RealmUser) {
        self.init()

        self.name = user.name
        self.email = user.email
        self.isActive = user.isActive
    }
}
