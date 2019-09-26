//
//  StorageService.swift
//  Friends
//
//  Created by Maksim Grebenozhko on 25/09/2019.
//  Copyright © 2019 Maksim Grebenozhko. All rights reserved.
//

import RealmSwift

typealias SaveUsersCompletion = () -> Void

protocol StorageService: AnyObject {
    static func checkAndSaveUsers(_ users: [User])
}

final class StorageServiceImpl: StorageService {
    
    static var users = [UserRealm]()
    
    static func checkAndSaveUsers(_ users: [User]) {
        for user in users {
            if notExistUserBy(id: user.id) {
                let userRealm = UserRealm.getUserObject(id: user.id, guid: user.guid,
                    isActive: user.isActive, balance: user.balance, age: user.age,
                    eyeColor: user.eyeColor.rawValue, name: user.name, gender: user.gender.rawValue,
                    company: user.company, email: user.email, phone: user.phone,
                    address: user.address, about: user.about, registered: user.registered,
                    latitude: user.latitude, longitude: user.longitude, tags: user.tags,
                    friends: user.friends, favoriteFruit: user.favoriteFruit.rawValue)
                self.users.append(userRealm)
            }
        }
    }
    
    static func notExistUserBy(id: Int) -> Bool {
        let realm = try! Realm()
        let idUser = realm.objects(UserRealm.self).filter("id == \(id)").first
        guard idUser == nil else { return false }
        return true
    }
    
    static func saveToDB(users: [UserRealm]) {
        
    }
    
}

