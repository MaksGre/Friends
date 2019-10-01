//
//  TagCollectionViewCell.swift
//  Friends
//
//  Created by Maksim Grebenozhko on 1/10/2019.
//  Copyright © 2019 Maksim Grebenozhko. All rights reserved.
//

import UIKit

class TagCollectionViewCell: UICollectionViewCell {

    // MARK: - Private properties

    private let label = TagLabel()

    // MARK: - Init

    override init(frame: CGRect) {
        super.init(frame: frame)
        congigureLabel()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - Public functions

    func configure(tag: String) {
        label.text = tag
    }

    // MARK: - Private function

    private func congigureLabel() {
        contentView.addSubview(label)
        label.clipsToBounds = true
        label.layer.cornerRadius = 10
        label.insets = UIEdgeInsets(top: 6, left: 10, bottom: 6, right: 10)
        label.backgroundColor = .gray
        label.textColor = .white
        label.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
