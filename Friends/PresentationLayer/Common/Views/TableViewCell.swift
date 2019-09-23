//
//  TableViewCell.swift
//  Friends
//
//  Created by Maksim Grebenozhko on 19/09/2019.
//  Copyright © 2019 Maksim Grebenozhko. All rights reserved.
//

import UIKit
import SnapKit

class TableViewCell: UITableViewCell {

//    @IBOutlet var nameLabel: UILabel!
//    @IBOutlet var emailLabel: UILabel!
//    @IBOutlet var activeLabel: UILabel!
    
// MARK: - Private properties
    
    private lazy var nameLabel = UILabel()
    private lazy var emailLabel = UILabel()
    private lazy var activeLabel = UILabel()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.addSubview(nameLabel)
        nameLabel.text = "Hello"
        nameLabel.snp.makeConstraints { (make) -> Void in
            make.width.height.equalTo(100)
            make.center.equalTo(self)
        }
    }

    func configureCellBy(_ user: User) {
        nameLabel.text = user.name
        emailLabel.text = user.email
        activeLabel.text = String(user.isActive)
    }

}
