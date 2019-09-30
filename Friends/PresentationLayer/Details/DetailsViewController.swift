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
    var user: User? { get set }
    func reloadData()
}

final class DetailsViewController: UIViewController, DetailsView {

    // MARK: - Private properties

    private let tableView = UITableView.init(frame: .zero, style: UITableView.Style.grouped)
    private let countDetails = 15
    //name, age, company, email, phone, address, about, balance, eyeColor,
    //favoriteFruit, registered, latitud, longitude, tags, friends
    // MARK: - DetailsView

    var presenter: DetailsPresenter?
    var user: User?
    
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
        return countDetails
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeue(DetailTableViewCell.self)
        if let detailText = user?.name {
            cell.configureCellBy(text: "name", detailText: detailText)
        }
        return cell
    }
}
