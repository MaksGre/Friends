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

    // MARK: - Private properties
    
    var nameLabel = UILabel()
//    var emailLabel = UILabel()
//    var activeLabel = UILabel()

    // MARK: - Override func
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        //nameLabel.backgroundColor = .white
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(nameLabel)
        nameLabel.snp.makeConstraints { (make) -> Void in
            //make.width.height.equalTo(100)
            make.center.equalTo(self)
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.addSubview(nameLabel)
        nameLabel.text = "Hello"
        nameLabel.font = UIFont(name: "HelveticaNeue-UltraLight", size: 30)
        nameLabel.textColor = .black
        nameLabel.snp.makeConstraints { (make) -> Void in
            make.width.height.equalTo(100)
            make.center.equalTo(self)
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.accessoryType = .none
    }

    func configureCellBy(_ text: String) {
        nameLabel.text = text
//        emailLabel.text = text
//        activeLabel.text = text
    }

}
