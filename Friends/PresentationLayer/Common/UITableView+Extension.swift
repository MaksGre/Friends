//
//  UITableView+Extension.swift
//  Friends
//
//  Created by Maksim Grebenozhko on 23/09/2019.
//  Copyright © 2019 Maksim Grebenozhko. All rights reserved.
//

import UIKit

extension UITableView {
    func registerWithNib<CellClass: UITableViewCell>(cellClass: CellClass.Type) {
        let cellClassName = String(describing: CellClass.self)
        let nib = UINib(nibName: cellClassName, bundle: nil)
        register(nib, forCellReuseIdentifier: cellClassName)
    }

    func register(CellClass: UITableViewCell.Type) {
        register(CellClass.self, forCellReuseIdentifier: String(describing: CellClass.self))
    }
    
    func dequeue<CellClass: UITableViewCell>(_: CellClass.Type) -> CellClass {
        let cellClassName = String(describing: CellClass.self)
        let cell = dequeueReusableCell(withIdentifier: cellClassName)
        guard let typedCell = cell as? CellClass else {
            fatalError("Could not deque cell with type \(CellClass.self)")
        }
        return typedCell
    }
}
