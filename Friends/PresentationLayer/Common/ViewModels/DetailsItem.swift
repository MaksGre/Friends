//
//  DetailsItem.swift
//  Friends
//
//  Created by Maksim Grebenozhko on 30/09/2019.
//  Copyright © 2019 Maksim Grebenozhko. All rights reserved.
//

import Foundation

struct DetailsItem {

    static let detailsCount = 15
    
    var id: Int
    var details: [[String: String]]
    var tags: [String]
    var friends: [Int]

    init(user: RealmUser) {
        self.id = user.id
        self.details = [["Balance:": user.balance]]
        self.details.append(["Age:": String(user.age)])
        self.details.append(["Eye Color:": user.eyeColor.rawValue])
        self.details.append(["Name:": user.name])
        self.details.append(["Company:": user.company])
        self.details.append(["Email:": user.email])
        self.details.append(["Phone:": user.phone])
        self.details.append(["Address:": user.address])
        self.details.append(["About:": user.about])
        self.details.append(["Registered": user.registered])
        self.details.append(["Latitude": String(user.latitude)])
        self.details.append(["Longitude": String(user.longitude)])
        self.details.append(["Favorite Fruit:": String(user.favoriteFruit.rawValue)])
        self.tags = user.tags.map {$0}
        self.friends = user.friends.map {$0}
    }
    
}
