//
//  UserDetailsCommonInfoItem.swift
//  Friends
//
//  Created by Maksim Grebenozhko on 1/10/2019.
//  Copyright © 2019 Maksim Grebenozhko. All rights reserved.
//

import UIKit

struct DetailsItem: UserDetailsItem {

    var title: String
    var value: String
    var text: NSAttributedString
    
    // MARK: - UserDetailsItem

    var didSeletectItem: ((UserDetailsItem) -> Void)?

    let CellType: (UITableViewCell & UserDetailsCell).Type = DetailTableViewCell.self
    
    init(title: String, value: String, didSeletectItem: ((UserDetailsItem) -> Void)? = nil) {
        self.title = title
        self.value = value
        self.didSeletectItem = didSeletectItem
        self.text = NSAttributedString(string: value)
    }
    init(title: String, text: NSAttributedString, didSeletectItem: ((UserDetailsItem) -> Void)? = nil) {
        self.title = title
        self.value = ""
        self.didSeletectItem = nil
        self.text = text
    }
}
