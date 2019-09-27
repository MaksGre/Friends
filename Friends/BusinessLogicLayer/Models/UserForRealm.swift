//
//  UserForRealm.swift
//  Friends
//
//  Created by Maksim Grebenozhko on 26/09/2019.
//  Copyright © 2019 Maksim Grebenozhko. All rights reserved.
//

import Foundation
import RealmSwift

class UserRealm: Object {
    @objc dynamic var id = Int()
    @objc dynamic var guid = String()
    @objc dynamic var isActive = Bool()
    @objc dynamic var balance = String()
    @objc dynamic var age = Int()
    @objc dynamic var eyeColor = String()
    @objc dynamic var name = String()
    @objc dynamic var gender = String()
    @objc dynamic var company = String()
    @objc dynamic var email = String()
    @objc dynamic var phone = String()
    @objc dynamic var address = String()
    @objc dynamic var about = String()
    @objc dynamic var registered = String()
    @objc dynamic var latitude = Double()
    @objc dynamic var longitude = Double()
    let tags = List<String>()
    let friends = List<Int>()
    @objc dynamic var favoriteFruit = String()
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
    static func getUserObject(
        id: Int, guid: String, isActive: Bool, balance: String, age: Int,
        eyeColor: String, name: String, gender: String,
        company: String, email: String, phone: String, address: String,
        about: String, registered: String, latitude: Double, longitude: Double,
        tags: [String], friends: [Friend], favoriteFruit: String) -> UserRealm {
        
        let user = UserRealm()
        user.id = id
        user.guid = guid
        user.isActive = isActive
        user.balance = balance
        user.age = age
        user.eyeColor = eyeColor
        user.name = name
        user.gender = gender
        user.company = company
        user.email = email
        user.phone = phone
        user.address = address
        user.about = about
        user.registered = registered
        user.latitude = latitude
        user.longitude = longitude
        for tag in tags {
            user.tags.append(tag)
        }
        for friend in friends {
            user.friends.append(friend.id)
        }
        user.favoriteFruit = favoriteFruit
        
        return user
    }
}

class SaveDate: Object {
    @objc dynamic var dateTime = Date()
}
