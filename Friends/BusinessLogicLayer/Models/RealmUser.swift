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
        self.init()
        
        self.id = user.id
        self.guid = user.guid
        self.isActive = user.isActive
        self.balance = user.balance
        self.age = user.age
        self.eyeColorString = user.eyeColor.rawValue
        self.name = user.name
        self.gender = user.gender.rawValue
        self.company = user.company
        self.email = user.email
        self.phone = user.phone
        self.address = user.address
        self.about = user.about
        self.registered = user.registered
        self.latitude = user.latitude
        self.longitude = user.longitude
        self.tags.append(objectsIn: user.tags)
        self.friends.append(objectsIn: user.friends.map { $0.id })
        self.favoriteFruitString = user.favoriteFruit.rawValue
    }
}

class SaveDate: Object {
    @objc dynamic var dateTime = Date()
}
