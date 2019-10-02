//
//  DetailsViewController.swift
//  Friends
//
//  Created Maksim Grebenozhko on 29/09/2019.
//  Copyright © 2019 Maksim Grebenozhko. All rights reserved.
//

import UIKit

struct UserDetailsSection {
    let title: String?
    let items: [UserDetailsItem]
}

protocol UserDetailsItem {
    var didSeletectItem: ((UserDetailsItem) -> Void)? { get set }
    var CellType: (UITableViewCell & UserDetailsCell).Type { get }
}

protocol UserDetailsCell {
    func configure(with item: UserDetailsItem)
}

protocol DetailsView: AnyObject {
    var presenter: DetailsPresenter? { get set }
    func reloadData(navigationItemTitle: String, sections: [UserDetailsSection])
}

final class DetailsViewController: UIViewController, DetailsView {

    // MARK: - Private properties

    private let tableView = UITableView.init(frame: .zero, style: UITableView.Style.grouped)
    private var sections: [UserDetailsSection] = []
    private var navigationItemTitle = ""
    
    // MARK: - Lifecycle

	override func viewDidLoad() {
        super.viewDidLoad()
            
        configureTableView()
        
        presenter?.didTriggerViewDidLoad()
        
        navigationItem.title = navigationItemTitle
        navigationController?.navigationBar.prefersLargeTitles = true
    }

    // MARK: - DetailsView

    var presenter: DetailsPresenter?

    func reloadData(navigationItemTitle: String, sections: [UserDetailsSection]) {
        self.navigationItemTitle = navigationItemTitle
        self.sections = sections
        tableView.reloadData()
    }

    // MARK: - Private functions
    
    private func configureTableView() {
        view.addSubview(self.tableView)
        
        tableView.register(CellClass: TagsTableViewCell.self)
        tableView.register(CellClass: MainTableViewCell.self)
        tableView.register(CellClass: DetailTableViewCell.self)

        tableView.dataSource = self
        tableView.delegate = self

        tableView.tableFooterView = UIView()
        tableView.rowHeight = UITableView.automaticDimension

        tableView.snp.makeConstraints { maker in
            maker.edges.equalToSuperview()
        }
    }
}

extension DetailsViewController: UITableViewDataSource {
    
    // MARK: - UITableViewDataSource

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section].title
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = sections[indexPath.section].items[indexPath.row]
        let cell = tableView.dequeue(item.CellType.self)
        if let cell = cell as? UserDetailsCell {
            cell.configure(with: item)
        } else {
            assertionFailure()
        }
        return cell
    }
}


extension DetailsViewController: UITableViewDelegate {

    // MARK: - UITableViewDelegate

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let item = sections[indexPath.section].items[indexPath.row]
        item.didSeletectItem?(item)
    }
}
