//
//  TagsTableViewCell.swift
//  Friends
//
//  Created by Maksim Grebenozhko on 1/10/2019.
//  Copyright © 2019 Maksim Grebenozhko. All rights reserved.
//

import UIKit
import SnapKit

class TagsTableViewCell: UITableViewCell, UserDetailsCell {

    // MARK: - Private properties

    private let collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 20, bottom: 0, right: 20)
        flowLayout.scrollDirection = .horizontal
        flowLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        return UICollectionView.init(frame: .zero, collectionViewLayout: flowLayout)
    }()

    private var tags: [String] = []

    // MARK: - Init

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .value2, reuseIdentifier: reuseIdentifier)
        configureCollectionView()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    // MARK: - UserDetailsCell

    func configure(with item: UserDetailsItem) {
        guard let item = item as? TagsItem else {
            assertionFailure()
            return
        }
        tags = item.tags
        collectionView.reloadData()
    }

    // MARK: - Private functions

    private func configureCollectionView() {
        contentView.addSubview(collectionView)
        collectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }

        collectionView.showsHorizontalScrollIndicator = false
        collectionView.alwaysBounceHorizontal = true
        collectionView.dataSource = self
        collectionView.backgroundColor = .white
        collectionView.register(CellClass: TagCollectionViewCell.self)
    }
}

extension TagsTableViewCell: UICollectionViewDataSource {

    // MARK: - UICollectionViewDataSource

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tags.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeue(TagCollectionViewCell.self, for: indexPath)
        cell.configure(tag: tags[indexPath.item])
        return cell
    }
}
