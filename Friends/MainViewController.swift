//
//  ViewController.swift
//  Friends
//
//  Created by Maksim Grebenozhko on 19/09/2019.
//  Copyright © 2019 Maksim Grebenozhko. All rights reserved.
//

import UIKit

class MainViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NetworkManager.shared.fetchData()
    }

    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let count = DataManager.shared.users?.count else { return 0 }
        
        return count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        
        if let user = DataManager.shared.users?[indexPath.row] {
            cell.configureCellBy(user)
        }
        
        return cell
        
    }
}

