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
    func saveUsers(completion: @escaping SaveUsersCompletion)
}

final class StorageServiceImpl: StorageService {
    
    func saveUsers(completion: @escaping SaveUsersCompletion) {
        
    }
    
}

