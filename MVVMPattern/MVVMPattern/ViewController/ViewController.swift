//
//  ViewController.swift
//  MVVMPattern
//
//  Created by Kimaya Desai on 12/20/22.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var tableView: UITableView!
    var arrMovieVM = [MovieViewModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.getData()
    }
    
    func getData() {
        Service.shareInstance.getAllMovieData(completion: { (movies, error) in
            if (error == nil) {
                self.arrMovieVM = movies?.map({
                    return MovieViewModel(movie: $0)
                }) ?? []
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
            
        })
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrMovieVM.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let mvM = arrMovieVM[indexPath.row]
        cell.textLabel?.text = mvM.artistName ?? ""
        cell.detailTextLabel?.text = mvM.trackName ?? ""
        return cell
    }
}

