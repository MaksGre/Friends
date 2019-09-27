//
//  UserItem.swift
//  Friends
//
//  Created by Maksim Grebenozhko on 23/09/2019.
//  Copyright © 2019 Maksim Grebenozhko. All rights reserved.
//

import Foundation

class UserItem {
    private var name = ""
    private var email = ""
    private var isActive = false
        
    convenience init(user: RealmUser) {
        let userItem = UserItem()
        
        userItem.name = user.name
        userItem.email = user.email
        userItem.isActive = user.isActive
        
        self.init()
    }
}
