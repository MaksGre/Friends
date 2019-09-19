//
//  NetworkManager.swift
//  Friends
//
//  Created by Maksim Grebenozhko on 19/09/2019.
//  Copyright © 2019 Maksim Grebenozhko. All rights reserved.
//

import Alamofire

class NetworkManager {
    
    static let shared = NetworkManager()

    let jsonUrl = "https://www.dropbox.com/s/s8g63b149tnbg8x/users.json?dl=0"
    
    func fetchData() {
        guard let url = URL(string: jsonUrl) else { return }
        
        request(url).validate().responseJSON { dataResponse in
            switch dataResponse.result {
            case .success:
                let decoder = JSONDecoder()
                do {
                    if let data = dataResponse.data {
                        DataManager.shared.users = try decoder.decode([User].self, from: data)
                    }
                } catch let error {
                    print(error)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
}
