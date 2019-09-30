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
    var user: DetailsItem? { get set }
    func reloadData()
}

final class DetailsViewController: UIViewController, DetailsView {

    // MARK: - Private properties

    private let tableView = UITableView.init(frame: .zero, style: UITableView.Style.grouped)
    //name, age, company, email, phone, address, about, balance, eyeColor,
    //favoriteFruit, registered, latitud, longitude, tags, friends
    // MARK: - DetailsView

    var presenter: DetailsPresenter?
    var user: DetailsItem?
    
    // MARK: - Lifecycle
    
    func reloadData() {
    }

	override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "Details"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        configureTableView()
        
        presenter?.didTriggerViewDidLoad()
    }

    // MARK: - Private functions
    
    private func configureTableView() {
        view.addSubview(self.tableView)
        tableView.register(CellClass: DetailTableViewCell.self)
        tableView.dataSource = self
        tableView.snp.makeConstraints { maker in
            maker.edges.equalToSuperview()
        }
    }
}

extension DetailsViewController: UITableViewDataSource {
    
    // MARK: - Table view data source
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return DetailsItem.detailsCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeue(DetailTableViewCell.self)
        let index = indexPath.row
        if let user = user {
            switch index {
            case 0...12:
                if let (key, value ) = user.details[index].first {
                    cell.configureCellBy(text: key, detailText: value)
                } else { return cell }
            case 13...14:
                cell.configureCellBy(text: "", detailText: "")
            default:
                cell.configureCellBy(text: "", detailText: "")
            }
        }
        return cell
    }
}
