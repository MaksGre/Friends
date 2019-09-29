//
//  DetailsTableViewManager.swift
//  Friends
//
//  Created Maksim Grebenozhko on 29/09/2019.
//  Copyright © 2019 Maksim Grebenozhko. All rights reserved.
//

import UIKit

protocol DetailsTableViewManagerDelegate: AnyObject {

}

final class DetailsTableViewManager: NSObject, UITableViewDataSource, UITableViewDelegate {

    private weak var tableView: UITableView?
    private weak var delegate: DetailsTableViewManagerDelegate?

    var dataSource: [<#DataSourceType#>] = [] {
        didSet {
            tableView?.reloadData()
        }
    }

    init(tableView: UITableView, delegate: DetailsTableViewManagerDelegate?) {
        self.tableView = tableView
        self.delegate = delegate

        super.init()

        tableView.delegate = self
        tableView.dataSource = self

        //tableView.registerWithNib(cellClass: <#CellClass#>.self)
    }

    // MARK: - UITableViewDataSource

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let item = dataSource[indexPath.row]
//        let cell = tableView.dequeue(<#CellClass#>.self, for: indexPath)
//        return cell
        return UITableViewCell()
    }

    // MARK: - UITableViewDelegate

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

    }
}
