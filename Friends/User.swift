//
//  User.swift
//  Friends
//
//  Created by Maksim Grebenozhko on 19/09/2019.
//  Copyright © 2019 Maksim Grebenozhko. All rights reserved.
//

import Foundation

struct User: Decodable {
    let id: Int
    let guid: String
    let isActive: Bool
    let balance: String
    let age: Int
    let eyeColor: EyeColor
    let name: String
    let gender: Gender
    let company, email, phone, address: String
    let about, registered: String
    let latitude, longitude: Double
    let tags: [String]
    let friends: [Friend]
    let favoriteFruit: FavoriteFruit
}

enum EyeColor: String, Decodable {
    case blue
    case brown
    case green
}

enum FavoriteFruit: String, Decodable {
    case apple
    case banana
    case strawberry
}

struct Friend: Decodable {
    let id: Int
}

enum Gender: String, Decodable {
    case female
    case male
}