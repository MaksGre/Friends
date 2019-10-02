//
//  DetailTableViewCell.swift
//  Friends
//
//  Created by Maksim Grebenozhko on 29/09/2019.
//  Copyright © 2019 Maksim Grebenozhko. All rights reserved.
//

import UIKit
import SnapKit

class DetailTableViewCell: UITableViewCell, UserDetailsCell, UserDetailsCellHeight {
    
    // MARK: - Private properties
    
    private var descriptionLabel = UILabel()
    private var valueLabel = UILabel()

    // MARK: - Init

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        configureElements()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private functions
    
    private func configureElements() {
        let fromLeftRight = 20
        let fromTop = 10
        let fromLeftForField = 120
            
        contentView.addSubview(valueLabel)
        valueLabel.text = "description"
        valueLabel.font = .systemFont(ofSize: 17.0, weight: .regular)
        valueLabel.textAlignment = .left
        valueLabel.numberOfLines = 0
        valueLabel.lineBreakMode = .byWordWrapping
        valueLabel.snp.makeConstraints {
            $0.left.equalTo(fromLeftForField)
            $0.right.equalTo(fromLeftRight)
            $0.top.equalTo(fromTop)
        }

        contentView.addSubview(descriptionLabel)
        descriptionLabel.text = "description"
        descriptionLabel.font = .systemFont(ofSize: 15.0, weight: .regular)
        descriptionLabel.adjustsFontSizeToFitWidth = true
        descriptionLabel.textColor = .blue
        descriptionLabel.textAlignment = .right
        descriptionLabel.snp.makeConstraints {
            $0.left.equalTo(fromLeftRight)
            $0.right.equalTo(valueLabel.snp.left).offset(-fromLeftRight)
            $0.centerY.equalTo(valueLabel.snp.centerY)
        }
        
    }

    // MARK: - UserDetailsCell

    func configure(with item: UserDetailsItem) {
        guard let item = item as? DetailsItem else {
            assertionFailure()
            return
        }
        descriptionLabel.text = item.title
        valueLabel.attributedText = item.text
        selectionStyle = item.didSeletectItem == nil ? .none : .default
    }
    
    // MARK: - UserDetailsCellHeight
    
    func heightForRowAt(index: Int) -> CGFloat {
        return descriptionLabel.bounds.height + 20
    }
}

