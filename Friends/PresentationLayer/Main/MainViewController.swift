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
    func reloadData()
    func set(users: [UserItem])
    func hideLoadingIndicator()
}

// MARK: - ViewImpl

final class MainViewController: UIViewController, MainView {

    // MARK: - Private properties
    
    private let tableView = UITableView.init(frame: .zero, style: UITableView.Style.grouped)
    private let refreshControl = UIRefreshControl()
    private var users: [UserItem] = []

    // MARK: - Public properties
    
    var presenter: MainPresenter?

    
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

    func hideLoadingIndicator() {
        refreshControl.endRefreshing()
    }

    func set(users: [UserItem]) {
        self.users = users
    }
    
    // MARK: - Private functions
    
    private func configureTableView() {
        view.addSubview(self.tableView)
        tableView.register(CellClass: MainTableViewCell.self)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = UITableView.automaticDimension
        tableView.tableFooterView = UIView()

        refreshControl.addTarget(self, action: #selector(refresh), for: .valueChanged)
        tableView.refreshControl = refreshControl

        tableView.snp.makeConstraints { maker in
            maker.edges.equalToSuperview()
        }
    }

    @objc private func refresh() {
        presenter?.didTriggerRefreshData()
    }
}

extension MainViewController: UITableViewDataSource, UITableViewDelegate {
    
    // MARK: - Table view data source
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeue(MainTableViewCell.self)
        cell.configure(with: users[indexPath.row])
        return cell
    }
    
    // MARK: - UITableViewDelegate
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let user = users[indexPath.row]
        if user.isActive {
            presenter?.didSelectUserById(id: user.id)
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
