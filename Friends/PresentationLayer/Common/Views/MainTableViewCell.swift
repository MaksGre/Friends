//
//  TableViewCell.swift
//  Friends
//
//  Created by Maksim Grebenozhko on 19/09/2019.
//  Copyright © 2019 Maksim Grebenozhko. All rights reserved.
//

import UIKit
import SnapKit

class MainTableViewCell: UITableViewCell {

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
        configureRightLabel(valueNameLabel, text: "name", topNeighbor: nil)
        configureRightLabel(valueEmailLabel, text: "email", topNeighbor: valueNameLabel)
        configureRightLabel(valueActiveLabel, text: "active", topNeighbor: valueEmailLabel)
        configureLeftLabel(descriptionNameLabel, text: "Name:", rightNeighbor: valueNameLabel)
        configureLeftLabel(descriptionEmailLabel, text: "Email:", rightNeighbor: valueEmailLabel)
        configureLeftLabel(descriptionActiveLabel, text: "Active:", rightNeighbor: valueActiveLabel)
    }
    
    private func configureRightLabel(_ label: UILabel, text: String, topNeighbor: UILabel?) {
        let fromLeft = 100
        let fromTop = 10
        let horizontalSpacing = 5
        let fontSize: CGFloat = 15.0
        
        contentView.addSubview(label)
        label.text = text
        label.font = .systemFont(ofSize: fontSize, weight: .regular)
        label.snp.makeConstraints {
            $0.left.equalTo(fromLeft)
            if let topNeighbor = topNeighbor {
                $0.top.equalTo(topNeighbor.snp.bottom).offset(horizontalSpacing)
            } else {
                $0.top.equalTo(fromTop)
            }
        }
    }
    
    private func configureLeftLabel(_ label: UILabel, text: String, rightNeighbor: UILabel?) {
        let verticalSpacing = 20
        let fontSize: CGFloat = 15.0
        
        contentView.addSubview(label)
        label.text = text
        label.font = .systemFont(ofSize: fontSize, weight: .regular)
        if let rightNeighbor = rightNeighbor {
            label.snp.makeConstraints {
                $0.right.equalTo(rightNeighbor.snp.left).offset(-verticalSpacing)
                $0.centerY.equalTo(rightNeighbor.snp.centerY).offset(0)
            }
        }
    }
    
    func configureCellBy(_ user: UserItem) {
        valueNameLabel.text = user.name
        valueEmailLabel.text = user.email
        valueActiveLabel.text = String(user.isActive)
    }

}