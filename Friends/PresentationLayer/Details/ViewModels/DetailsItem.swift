//
//  UserDetailsCommonInfoItem.swift
//  Friends
//
//  Created by Maksim Grebenozhko on 1/10/2019.
//  Copyright © 2019 Maksim Grebenozhko. All rights reserved.
//

import UIKit


struct DetailsItem: UserDetailsItem {

    enum TextType {
        case plain(String)
        case attributed(NSAttributedString)
    }
    
    var title: String
    var textType: TextType
    
    // MARK: - UserDetailsItem

    var didSeletectItem: ((UserDetailsItem) -> Void)? = nil

    let CellType: (UITableViewCell & UserDetailsCell).Type = DetailTableViewCell.self
    
    init(title: String, textType: TextType, didSeletectItem: ((UserDetailsItem) -> Void)? = nil) {
        self.title = title
        self.textType = textType
        self.didSeletectItem = didSeletectItem
    }
}
