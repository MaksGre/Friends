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
    
    private let titleLabel = UILabel()
    private let valueLabel = UILabel()

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
        let fromTop = 5
        let fromLeftForField = 120

        contentView.addSubview(titleLabel)
        contentView.addSubview(valueLabel)

        titleLabel.text = "description"
        titleLabel.font = .systemFont(ofSize: 15.0, weight: .regular)
        titleLabel.adjustsFontSizeToFitWidth = true
        titleLabel.textColor = .blue
        titleLabel.textAlignment = .right
        titleLabel.snp.makeConstraints {
            $0.left.equalToSuperview().offset(fromLeftRight)
            $0.right.equalTo(valueLabel.snp.left).offset(-fromLeftRight)
            $0.centerY.equalToSuperview()
        }

        valueLabel.text = "description"
        valueLabel.font = .systemFont(ofSize: 17.0, weight: .regular)
        valueLabel.textAlignment = .left
        valueLabel.numberOfLines = 0
        valueLabel.lineBreakMode = .byWordWrapping
        valueLabel.snp.makeConstraints {
            $0.left.equalToSuperview().offset(fromLeftForField)
            $0.right.equalToSuperview().offset(-fromLeftRight)
            $0.top.equalToSuperview().offset(fromTop)
            $0.bottom.equalToSuperview().offset(-fromTop)
        }
    }

    // MARK: - UserDetailsCell

    func configure(with item: UserDetailsItem) {
        guard let item = item as? DetailsItem else {
            assertionFailure()
            return
        }
        titleLabel.text = item.title
        switch item.textType {
        case .plain(let text):
            valueLabel.attributedText = nil
            valueLabel.text = text
        case .attributed(let attributedText):
            valueLabel.text = nil
            valueLabel.attributedText = attributedText
        }
        selectionStyle = item.didSeletectItem == nil ? .none : .default
    }
    
}

