//
//  StorageService.swift
//  Friends
//
//  Created by Maksim Grebenozhko on 25/09/2019.
//  Copyright © 2019 Maksim Grebenozhko. All rights reserved.
//

import Foundation
import RealmSwift

typealias SaveUsersCompletion = () -> Void

protocol StorageService: AnyObject {
    static func saveUsers(_ users: [User])
}

final class StorageServiceImpl: StorageService {
    
    // MARK: - Static properties
    
    static let constStorageTime: TimeInterval = 300
    
    // MARK: - Static functions
    
    static func saveUsers(_ users: [User]) {
        print(Realm.Configuration.defaultConfiguration.fileURL!)
        let realmInstance = try! Realm()
        try! realmInstance.write {
            for user in users {
                let userRealm = UserRealm.getUserObject(id: user.id, guid: user.guid,
                    isActive: user.isActive, balance: user.balance, age: user.age,
                    eyeColor: user.eyeColor.rawValue, name: user.name, gender: user.gender.rawValue,
                    company: user.company, email: user.email, phone: user.phone,
                    address: user.address, about: user.about, registered: user.registered,
                    latitude: user.latitude, longitude: user.longitude, tags: user.tags,
                    friends: user.friends, favoriteFruit: user.favoriteFruit.rawValue)
                realmInstance.add(userRealm)
            }
            realmInstance.add(SaveDate())
        }
        print("\(Date()) The data stored")
        DispatchQueue.main.asyncAfter(deadline: .now() + constStorageTime) {
            deleteData()
            print("\(Date()) Data deleted")
        }
    }
    
    static func storageTimeIsOver() -> Bool {
        let realmInstance = try! Realm()
        guard let dateTime = realmInstance.objects(SaveDate.self).first else { return true }
        print("\(Date()) Check save time")
        return Date().timeIntervalSince(dateTime.dateTime) > constStorageTime
    }
    
    static func deleteData() {
        let realmInstance = try! Realm()
        try! realmInstance.write {
            realmInstance.deleteAll()
        }
    }
}
