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
}

// MARK: - ViewImpl

final class MainViewController: UIViewController, MainView {
    
    // MARK: - Private properties
    private var data = ["Aisha Velasquez", "Brady Tyler", "Guy Trujillo", "Barker Powell",
                        "Goldie Clemons", "Caldwell Daniels", "Bonnie Guerrero",
                        "Mcmahon Parrish", "Mccray Kim", "Craig Short", "Hurley Larson",
                        "Katie Shepherd", "Vasquez Bird", "Stout Nelson", "Tameka Lott",
                        "Aisha Velasquez", "Brady Tyler", "Guy Trujillo", "Barker Powell",
                        "Goldie Clemons", "Caldwell Daniels", "Bonnie Guerrero",
                        "Mcmahon Parrish", "Mccray Kim", "Craig Short", "Hurley Larson",
                        "Katie Shepherd", "Vasquez Bird", "Stout Nelson", "Tameka Lott"]
    
    let tableView = UITableView.init(frame: .zero, style: UITableView.Style.grouped)
    let tableCellIdentifier = String(describing: TableViewCell.self)
    var presenter: MainPresenter?
    
    // MARK: - Override methods
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.title = "People"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        view.addSubview(self.tableView)
        tableView.register(TableViewCell.self, forCellReuseIdentifier: tableCellIdentifier)
        tableView.dataSource = self
        tableView.rowHeight = 90
        
        updateLayout(with: self.view.frame.size)
        
        presenter?.didTriggerViewReadyEvent()
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        coordinator.animate(alongsideTransition: { (contex) in
            self.updateLayout(with: size)
        }, completion: nil)
    }
    
    // MARK: - private func
    
    private func updateLayout(with size: CGSize) {
        tableView.frame = CGRect.init(origin: .zero, size: size)
    }
    
}

extension MainViewController: UITableViewDataSource {
    
    // MARK: - Table view data source
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return data.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: tableCellIdentifier, for: indexPath) as! TableViewCell
        cell.configureCellBy(data[indexPath.row])
        if indexPath.row == 0 {
            cell.accessoryType = .disclosureIndicator
        }
        
        return cell
    }
}
