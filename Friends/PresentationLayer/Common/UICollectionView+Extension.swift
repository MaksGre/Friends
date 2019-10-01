//
//  UICollectionView+Extension.swift
//  Friends
//
//  Created by Maksim Grebenozhko on 23/09/2019.
//  Copyright © 2019 Maksim Grebenozhko. All rights reserved.
//

import UIKit

extension UICollectionView {
    func register(CellClass: UICollectionViewCell.Type) {
        register(CellClass.self, forCellWithReuseIdentifier: String(describing: CellClass.self))
    }

    func dequeue<CellClass: UICollectionViewCell>(_ CellClass: CellClass.Type, for indexPath: IndexPath) -> CellClass {
        let cellClassName = String(describing: CellClass.self)
        let cell = dequeueReusableCell(withReuseIdentifier: cellClassName, for: indexPath)
        guard let typedCell = cell as? CellClass else {
            fatalError("Could not deque cell with type \(CellClass.self)")
        }
        return typedCell
    }
}
