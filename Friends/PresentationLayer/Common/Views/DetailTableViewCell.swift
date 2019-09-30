//
//  DetailTableViewCell.swift
//  Friends
//
//  Created by Maksim Grebenozhko on 29/09/2019.
//  Copyright © 2019 Maksim Grebenozhko. All rights reserved.
//

import UIKit
import SnapKit

class DetailTableViewCell: UITableViewCell {
    
    // MARK: - Private properties
    
    // MARK: - Override func

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .value2, reuseIdentifier: reuseIdentifier)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureCellBy(text: String, detailText: String) {
        textLabel?.text = text
        self.detailTextLabel?.text = detailText
    }
    
}

