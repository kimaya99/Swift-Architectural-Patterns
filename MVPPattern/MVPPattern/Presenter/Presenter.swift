//
//  Presenter.swift
//  MVPPattern
//
//  Created by Kimaya Desai on 12/21/22.
//

import UIKit


protocol UserPresenterDelegate: AnyObject {
    func presentUsers(users: [User])
    func presentAlert(title: String, message: String)
}

typealias PresenterDelegate = UserPresenterDelegate & UIViewController

class UserPresenter {
    
    weak var delegate: PresenterDelegate?
    
    public func getUsers() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else { return }
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data, error == nil else { return }
            do {
                let users = try JSONDecoder().decode([User].self, from: data)
                self?.delegate?.presentUsers(users: users)
            } catch {
                print(error)
            }
        }
        task.resume()
    }
    
    public func setViewDelegate(delegate:PresenterDelegate ) {
        self.delegate = delegate
    }
    
    public func didTapUser(user: User) {
        //delegate?.presentAlert(title: user.name, message: "\(user.email)")
        
        let title = user.name
        let message = user.email
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Dismiss", style: .cancel))
        delegate?.present(alert, animated: true)
    }
    
    
}
