//
//  ViewController.swift
//  MVPPattern
//
//  Created by Kimaya Desai on 12/21/22.
//

import UIKit

class UsersViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UserPresenterDelegate {
    func presentAlert(title: String, message: String) {
    }
    
    
    private let tableView: UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return table
    }()
    
    private let presenter = UserPresenter()
    private var users = [User]()

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Users"
        // Table
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        
        // Presenter
        presenter.setViewDelegate(delegate: self)
        presenter.getUsers()
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel!.text = users[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        presenter.didTapUser(user: users[indexPath.row])
    }
    
    func presentUsers(users: [User]) {
        self.users = users
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}

