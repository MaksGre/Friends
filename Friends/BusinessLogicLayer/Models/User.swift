//
//  User.swift
//  Friends
//
//  Created by Maksim Grebenozhko on 19/09/2019.
//  Copyright © 2019 Maksim Grebenozhko. All rights reserved.
//

import UIKit

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
    case blue, brown, green
    
    var colorDot: NSAttributedString {
        var color = UIColor()
        switch self {
        case .blue: color = .blue
        case .brown: color = .brown
        case .green: color = .green
        }
        let font = UIFont.boldSystemFont(ofSize: 17)
        let attributes: [NSAttributedString.Key: Any] = [
            .font: font,
            .foregroundColor: color
        ]
        return NSAttributedString(string: ".", attributes: attributes)
    }
}

enum FavoriteFruit: String, Decodable {
    case apple, banana, strawberry
    
    var emoji: String {
        switch self {
        case .apple: return "🍏"
        case .banana: return "🍌"
        case .strawberry: return "🍓"
        }
    }
}

struct Friend: Decodable {
    let id: Int
}

enum Gender: String, Decodable {
    case female, male
}
