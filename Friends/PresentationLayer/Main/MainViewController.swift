//
//  ViewController.swift
//  Friends
//
//  Created by Maksim Grebenozhko on 19/09/2019.
//  Copyright © 2019 Maksim Grebenozhko. All rights reserved.
//

import UIKit

protocol MainView: AnyObject {
    var presenter: MainPresenter? { get set }
    var users: [UserItem]? { get set }
    func reloadData()
}

// MARK: - ViewImpl

final class MainViewController: UIViewController, MainView {

    // MARK: - Private properties
    
    private let tableView = UITableView.init(frame: .zero, style: UITableView.Style.grouped)
    
    // MARK: - Public properties
    
    var presenter: MainPresenter?
    var users: [UserItem]?
    
    // MARK: - Override methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "People"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        configureTableView()
        
        presenter?.didTriggerViewReadyEvent()
    }
    
    // MARK: - Public functions
    
    func reloadData() {
        tableView.reloadData()
    }
    
    // MARK: - Private functions
    
    private func configureTableView() {
        let rowHeight:CGFloat = 90
        
        view.addSubview(self.tableView)
        tableView.register(CellClass: MainTableViewCell.self)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = rowHeight
        tableView.snp.makeConstraints { maker in
            maker.edges.equalToSuperview()
        }
    }
}

extension MainViewController: UITableViewDataSource, UITableViewDelegate {
    
    // MARK: - Table view data source
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let count = users?.count else { return 0 }

        return count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeue(MainTableViewCell.self)
        if let user = users?[indexPath.row] {
            cell.configureCellBy(user)
            if user.isActive {
                cell.accessoryType = .disclosureIndicator
            }
        }
        
        return cell
    }
    
    // MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let user = users?[indexPath.row] else { return }
        
        if user.isActive {
            presenter?.didSelectRow(index: indexPath.row)
        }
    }
    
}
