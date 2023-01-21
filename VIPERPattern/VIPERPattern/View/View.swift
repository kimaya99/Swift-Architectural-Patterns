//
//  View.swift
//  VIPERPattern
//
//  Created by Kimaya Desai on 12/21/22.
//

import UIKit
// User Interface
// View Controller + protocol
// Reference to the presenter

protocol AnyView {
    var presentor: AnyPresenter? { get set }
    
    func update(with users:[User])
    func update(with error: String)
}


class UserView: UIViewController, AnyView, UITableViewDelegate, UITableViewDataSource {
    
    
    var presentor: AnyPresenter?
    
    private var tableView: UITableView = {
        let table = UITableView()
        table.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        table.isHidden = true
        return table
    }()
    
    private var label : UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.isHidden = true
        return label
    }()
    
    
    var users : [User] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(label)
        label.center = view.center
        view.addSubview(tableView)
        view.backgroundColor = .systemBlue
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func update(with users: [User]) {
        DispatchQueue.main.async {
            self.users = users
            self.tableView.isHidden = false
            self.tableView.reloadData()
        }
    }
    
    func update(with error: String) {
        DispatchQueue.main.async {
            self.users = []
            self.label.text = error
            self.tableView.isHidden = true
            self.label.isHidden = false
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
        label.center = view.center
        label.frame = CGRect(x: 0, y: 0, width: 200, height: 100)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = users[indexPath.row].name
        return cell
    }
}
