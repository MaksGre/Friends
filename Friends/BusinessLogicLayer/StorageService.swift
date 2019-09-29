//
//  StorageService.swift
//  Friends
//
//  Created by Maksim Grebenozhko on 25/09/2019.
//  Copyright © 2019 Maksim Grebenozhko. All rights reserved.
//

import Foundation
import RealmSwift

protocol StorageService: AnyObject {
    func store(users: [RealmUser])
    func subscribe(completion: @escaping (Results<RealmUser>) -> Void)
    func unsubscribe()
    func getLastUpdateDate() -> Date?
    func storeLastUpdateDate(date: Date)
    func loadUser(index: Int) -> User
}

final class StorageServiceImpl: StorageService {
    
    // MARK: - Private properties
    
    private var token: NotificationToken?
    
    // MARK: - StorageService
    
    func store(users: [RealmUser]) {
        print(Realm.Configuration.defaultConfiguration.fileURL!)
        let realm = getRealm()
//        do {
//            try realm.write {
//                let existedUsers = realm.objects(RealmUser.self)
//                realm.delete(existedUsers)
//                realm.add(users, update: .modified)
//            }
//        } catch {
//            assertionFailure(error.localizedDescription)
//        }
//        print("1")
//        do {
//            print("2")
//            try realm.write {
//                print("3")
//                let existedUsers = realm.objects(RealmUser.self)
//                realm.delete(existedUsers)
//                realm.add(users, update: .modified)
//            }
//        } catch {
//            print("4")
//            print(error)
//            print("5")
//            assertionFailure(error.localizedDescription)
//        }
//        print("6")
        try! realm.write {
            realm.deleteAll()
            realm.add(users)
        }
    }

    func subscribe(completion: @escaping (Results<RealmUser>) -> Void) {
        token = getRealm().objects(RealmUser.self).observe { changes in
            switch changes {
            case .error(let error):
                print(error)
            case .initial(let users), .update(let users, _, _, _):
                completion(users)
            }
        }
    }
    
    func unsubscribe() {
        token?.invalidate()
    }
    
    func getLastUpdateDate() -> Date? {
        let realm = getRealm()
        guard let lastUpdateDate = realm.objects(SaveDate.self).first
            else { return nil }
        return lastUpdateDate.dateTime
    }
    
    func storeLastUpdateDate(date: Date) {
        let realm = getRealm()
//        do {
//            try realm.write {
//                let saveDate = realm.objects(SaveDate.self)
//                realm.delete(saveDate)
//                realm.add(SaveDate(), update: .error)
//            }
            try! realm.write {
                realm.add(SaveDate())
            }
//        } catch {
//            assertionFailure(error.localizedDescription)
//        }
    }
    
    func loadUser(index: Int) -> User {
        let realmUser = getRealm().objects(RealmUser.self).filter("id = \(index)")
        return 
    }
    
    // MARK: - Private functions
    
    private func getRealm() -> Realm {
        do {
            return try Realm()
        } catch {
            fatalError(error.localizedDescription)
        }
    }
}
