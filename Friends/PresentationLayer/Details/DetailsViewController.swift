//
//  DetailsViewController.swift
//  Friends
//
//  Created Maksim Grebenozhko on 29/09/2019.
//  Copyright © 2019 Maksim Grebenozhko. All rights reserved.
//

import UIKit

protocol DetailsView: AnyObject {
    var presenter: DetailsPresenter? { get set }
    var users: [User]? { get set }
    func reloadData()
}

final class DetailsViewController: UIViewController, DetailsView {

    // MARK: - Private properties

    private lazy var tableViewManager: TableViewManager = {
        return TableViewManager(tableView: tableView)
    }()

    // MARK: - DetailsView

    var presenter: DetailsPresenter?
    
    // MARK: - Outlets

    @IBOutlet private var tableView: UITableView!

    // MARK: - Lifecycle

	override func viewDidLoad() {
        super.viewDidLoad()
        presenter.didTriggerViewDidLoad()
    }

    // MARK: - Actions

    func reload(with content: TableContent) {
        tableViewManager.reload(with: content)
    }
}
