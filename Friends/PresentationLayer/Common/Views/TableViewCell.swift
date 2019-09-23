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
    
    private var descriptionNameLabel = UILabel()
    private var descriptionEmailLabel = UILabel()
    private var descriptionActiveLabel = UILabel()
    private var valueNameLabel = UILabel()
    private var valueEmailLabel = UILabel()
    private var valueActiveLabel = UILabel()

    // MARK: - Override func
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configureLabels()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.accessoryType = .none
    }

    private func configureLabels() {
        let fromTop = 10
        //let toBottom = 10
        let fromLeft = 20
        //let toRight = 20
        //let verticalSpacing = 20
        let horizontalSpacing = 5
        let height = 21
        
        descriptionNameLabel.text = "Name:"
        descriptionEmailLabel.text = "Email:"
        descriptionActiveLabel.text = "Active:"
        
        contentView.addSubview(descriptionNameLabel)
        contentView.addSubview(descriptionEmailLabel)
        contentView.addSubview(descriptionActiveLabel)
        contentView.addSubview(valueNameLabel)
        contentView.addSubview(valueEmailLabel)
        contentView.addSubview(valueActiveLabel)
        
        descriptionNameLabel.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(fromTop)
            make.left.equalTo(fromLeft)
            make.height.equalTo(height)
        }
        descriptionEmailLabel.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(fromTop + height + horizontalSpacing)
            make.left.equalTo(fromLeft)
            make.height.equalTo(height)
        }
        descriptionActiveLabel.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(fromTop + height * 2 + horizontalSpacing * 2)
            make.left.equalTo(fromLeft)
            make.height.equalTo(height)
        }
        valueNameLabel.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(fromTop)
            make.left.equalTo(fromLeft + 60)
            make.height.equalTo(height)
        }
        valueEmailLabel.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(fromTop + height + horizontalSpacing)
            make.left.equalTo(fromLeft + 60)
            make.height.equalTo(height)
        }
        valueActiveLabel.snp.makeConstraints { (make) -> Void in
            make.top.equalTo(fromTop + height * 2 + horizontalSpacing * 2)
            make.left.equalTo(fromLeft + 60)
            make.height.equalTo(height)
        }
        
    }
    
    func configureCellBy(_ text: String) {
        valueNameLabel.text = text
        valueEmailLabel.text = text
        valueActiveLabel.text = text
    }

}
