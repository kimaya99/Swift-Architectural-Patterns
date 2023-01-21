//
//  Interactor.swift
//  VIPERPattern
//
//  Created by Kimaya Desai on 12/21/22.
//

import Foundation

// Object
// Protocol
// Reference to presenter


//https://jsonplaceholder.typicode.com/users

protocol AnyInteractor {
    var presentor: AnyPresenter? { get set }

    func getUsers()
}


class UserInteractor: AnyInteractor {
    var presentor: AnyPresenter?
    
    func getUsers() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else { return }
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data, error == nil else {
                self?.presentor?.interactorDidFetchUsers(with: .failure(FetchError.failed))
                return
            }
            
            do {
                let entity = try JSONDecoder().decode([User].self, from: data)
                self?.presentor?.interactorDidFetchUsers(with: .success(entity))
            }
            catch {
                self?.presentor?.interactorDidFetchUsers(with: .failure(error))
            }
        }
        task.resume()
    }
}
