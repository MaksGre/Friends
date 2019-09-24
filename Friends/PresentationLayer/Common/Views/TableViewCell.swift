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
        configureLabel(valueNameLabel, text: "name", labelOnRight: true,
                       topNeighbor: nil, rightNeighbor: nil)
        configureLabel(valueEmailLabel, text: "email", labelOnRight: true,
                       topNeighbor: valueNameLabel, rightNeighbor: nil)
        configureLabel(valueActiveLabel, text: "active", labelOnRight: true,
                       topNeighbor: valueEmailLabel, rightNeighbor: nil)
        configureLabel(descriptionNameLabel, text: "Name:", labelOnRight: false,
                       topNeighbor: nil, rightNeighbor: valueNameLabel)
        configureLabel(descriptionEmailLabel, text: "Email:", labelOnRight: false,
                       topNeighbor: descriptionNameLabel, rightNeighbor: valueEmailLabel)
        configureLabel(descriptionActiveLabel, text: "Active:", labelOnRight: false,
                       topNeighbor: descriptionEmailLabel, rightNeighbor: valueActiveLabel)
    }
    
    private func configureLabel(_ label: UILabel, text: String, labelOnRight: Bool,
                                topNeighbor: UILabel?, rightNeighbor: UILabel?) {
        let fromLeft = 100
        let fromTop = 10
        let horizontalSpacing = 5
        let verticalSpacing = 20
        let fontSize: CGFloat = 15.0
        var topOffset = 0
        
        contentView.addSubview(label)
        label.text = text
        label.font = .systemFont(ofSize: fontSize, weight: .regular)
        label.snp.makeConstraints {
            if labelOnRight {
                $0.left.equalTo(fromLeft)
            } else {
                if let rightNeighbor = rightNeighbor {
                    $0.right.equalTo(rightNeighbor.snp.left).offset(-verticalSpacing)
                }
            }
            if let topNeighbor = topNeighbor {
                $0.top.equalTo(topNeighbor.snp.bottom).offset(horizontalSpacing)
            } else {
                $0.top.equalTo(fromTop)
            }
        }
    }
    
    private func configureLabel(_ label: UILabel, text: String, labelOnRight: Bool,
                                topNeighbor: UILabel?, rightNeighbor: UILabel?) {
        let fromLeft = 100
        let fromTop = 10
        let horizontalSpacing = 5
        let verticalSpacing = 20
        let fontSize: CGFloat = 15.0
        var topOffset = 0
        
        contentView.addSubview(label)
        label.text = text
        label.font = .systemFont(ofSize: fontSize, weight: .regular)
        label.snp.makeConstraints {
            if labelOnRight {
                $0.left.equalTo(fromLeft)
            } else {
                if let rightNeighbor = rightNeighbor {
                    $0.right.equalTo(rightNeighbor.snp.left).offset(-verticalSpacing)
                }
            }
            if let topNeighbor = topNeighbor {
                $0.top.equalTo(topNeighbor.snp.bottom).offset(horizontalSpacing)
            } else {
                $0.top.equalTo(fromTop)
            }
        }
    }
    
    func configureCellBy(_ text: String) {
        valueNameLabel.text = text
        valueEmailLabel.text = text
        valueActiveLabel.text = text
    }

}
