//
//  UserForRealm.swift
//  Friends
//
//  Created by Maksim Grebenozhko on 26/09/2019.
//  Copyright © 2019 Maksim Grebenozhko. All rights reserved.
//

import Foundation
import RealmSwift

class UserRealm: Object, Decodable {
    @objc dynamic var id: Int
    @objc dynamic var guid: String
    @objc dynamic var isActive: Bool
    @objc dynamic var balance: String
    @objc dynamic var age: Int
    let eyeColor = List<EyeColorRealm>()
    @objc dynamic var name: String
    let gender = List<GenderRealm>()
    @objc dynamic var company, email, phone, address: String
    @objc dynamic var about, registered: String
    @objc dynamic var latitude, longitude: Double
    let tags = List<String>()
    let friends = List<FriendRealm>()
    let favoriteFruit = List<FavoriteFruitRealm>()
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
    static func getUserObject(
        id: Int, guid: String, isActive: Bool, balance: String, age: Int,
        eyeColor: EyeColorRealm, name: String, gender: GenderRealm,
        company: String, email: String, phone: String, address: String,
        about: String, registered: String, latitude: Double, longitude: Double,
        tags: [String], friends: [FriendRealm], favoriteFruit: [FavoriteFruitRealm]) -> UserRealm {
        
        let user = UserRealm(from: <#Decoder#>)
        
        return user
    }
}

class EyeColorRealm: Object, Decodable {
    @objc dynamic var id: Int
    @objc dynamic var name: String
    
    override static func primaryKey() -> String? {
        return "id"
    }
}

class FavoriteFruitRealm: Object, Decodable {
    @objc dynamic var id: Int
    @objc dynamic var name: String
    
    override static func primaryKey() -> String? {
        return "id"
    }
}

class FriendRealm: Object, Decodable {
    @objc dynamic var id: Int
    
    override static func primaryKey() -> String? {
        return "id"
    }
}

class GenderRealm: Object, Decodable {
    @objc dynamic var id: Int
    @objc dynamic var name: String
    
    override static func primaryKey() -> String? {
        return "id"
    }
}
