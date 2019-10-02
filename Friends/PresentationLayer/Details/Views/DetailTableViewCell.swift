//
//  DetailTableViewCell.swift
//  Friends
//
//  Created by Maksim Grebenozhko on 29/09/2019.
//  Copyright © 2019 Maksim Grebenozhko. All rights reserved.
//

import UIKit
import SnapKit

class DetailTableViewCell: UITableViewCell, UserDetailsCell {
    
    // MARK: - Private properties
    
    // MARK: - Init

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .value2, reuseIdentifier: reuseIdentifier)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - UserDetailsCell

    func configure(with item: UserDetailsItem) {
        guard let item = item as? DetailsItem else {
            assertionFailure()
            return
        }
        textLabel?.text = item.title
        detailTextLabel?.attributedText = item.text
        selectionStyle = item.didSeletectItem == nil ? .none : .default
    }
}

