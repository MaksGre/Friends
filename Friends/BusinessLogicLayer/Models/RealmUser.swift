//
//  RealmUser.swift
//  Friends
//
//  Created by Maksim Grebenozhko on 26/09/2019.
//  Copyright © 2019 Maksim Grebenozhko. All rights reserved.
//

import Foundation
import RealmSwift

class RealmUser: Object {
    @objc dynamic var id = Int()
    @objc dynamic var guid = String()
    @objc dynamic var isActive = Bool()
    @objc dynamic var balance = String()
    @objc dynamic var age = Int()
    @objc dynamic private var eyeColorString = String()
    var eyeColor: EyeColor {
        return EyeColor(rawValue: eyeColorString) ?? EyeColor.brown
    }
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
    @objc dynamic private var favoriteFruitString = String()
    var favoriteFruit: FavoriteFruit {
        return FavoriteFruit(rawValue: favoriteFruitString) ?? FavoriteFruit.apple
}
    
    override static func primaryKey() -> String? {
        return #keyPath(RealmUser.id)
    }
 
    convenience init(user: User) {
        let realmUser = RealmUser()
        
        realmUser.id = user.id
        realmUser.guid = user.guid
        realmUser.isActive = user.isActive
        realmUser.balance = user.balance
        realmUser.age = user.age
        realmUser.eyeColorString = user.eyeColor.rawValue
        realmUser.name = user.name
        realmUser.gender = user.gender.rawValue
        realmUser.company = user.company
        realmUser.email = user.email
        realmUser.phone = user.phone
        realmUser.address = user.address
        realmUser.about = user.about
        realmUser.registered = user.registered
        realmUser.latitude = user.latitude
        realmUser.longitude = user.longitude
        realmUser.tags.append(objectsIn: user.tags)
        realmUser.friends.append(objectsIn: user.friends.map { $0.id })
        realmUser.favoriteFruitString = user.favoriteFruit.rawValue
        self.init()
    }
}

class SaveDate: Object {
    @objc dynamic var dateTime = Date()
}
