//
//  TagsItem.swift
//  Friends
//
//  Created by Maksim Grebenozhko on 1/10/2019.
//  Copyright © 2019 Maksim Grebenozhko. All rights reserved.
//

import UIKit

struct TagsItem: UserDetailsItem {

    let tags: [String]

    // MARK: - UserDetailsItem

    var didSeletectItem: ((UserDetailsItem) -> Void)?

    let CellType: (UITableViewCell & UserDetailsCell).Type = TagsTableViewCell.self
}
