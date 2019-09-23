//
//  ViewController.swift
//  Friends
//
//  Created by Maksim Grebenozhko on 19/09/2019.
//  Copyright © 2019 Maksim Grebenozhko. All rights reserved.
//

import UIKit
import SnapKit

protocol MainView: AnyObject {
    var presenter: MainPresenter? { get set }
}

// MARK: - ViewImpl

final class MainViewController: UITableViewController, MainView {
    
    // MARK: - Private properties
    
    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
TableViewCell
        //presenter?.didTriggerViewReadyEvent()
    }
    
    // MARK: - Actions
    
    // MARK: - MainView
    
    var presenter: MainPresenter?
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: TableViewCell.self), for: indexPath) as! TableViewCell
        
        return cell
        
    }
}

