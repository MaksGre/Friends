//
//  NetworkService.swift
//  Friends
//
//  Created by Maksim Grebenozhko on 19/09/2019.
//  Copyright © 2019 Maksim Grebenozhko. All rights reserved.
//

import Alamofire

typealias FetchUsersCompletion = (Result<[User]>) -> Void

enum NetworkServiceError: Error {
    case badURL
}

protocol NetworkService: AnyObject {
    func fetchUsers(completion: @escaping FetchUsersCompletion)
}

final class NetworkServiceImpl: NetworkService {
    
    private let jsonUrl = "https://dl.dropboxusercontent.com/s/s8g63b149tnbg8x/users.json?dl=0"
    
    func fetchUsers(completion: @escaping FetchUsersCompletion) {
        guard let url = URL(string: jsonUrl) else {
            completion(.failure(NetworkServiceError.badURL))
            return
        }
        request(url).validate().responseJSON { dataResponse in
            switch dataResponse.result {
            case .success:
                let decoder = JSONDecoder()
                do {
                    if let data = dataResponse.data {
                        let users = try decoder.decode([User].self, from: data)
                        DispatchQueue.main.async {
                            completion(.success(users))
                        }
                    }
                } catch {
                    print(error)
                    completion(.failure(error))
                }
            case .failure(let error):
                print(error)
                completion(.failure(error))
            }
        }
    }
}
