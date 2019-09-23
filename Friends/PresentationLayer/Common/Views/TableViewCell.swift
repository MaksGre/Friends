//
//  TableViewCell.swift
//  Friends
//
//  Created by Maksim Grebenozhko on 19/09/2019.
//  Copyright © 2019 Maksim Grebenozhko. All rights reserved.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var emailLabel: UILabel!
    @IBOutlet var activeLabel: UILabel!
    
    func configureCellBy(_ user: User) {
        nameLabel.text = user.name
        emailLabel.text = user.email
        activeLabel.text = String(user.isActive)
    }

}
