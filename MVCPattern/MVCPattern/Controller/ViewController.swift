//
//  ViewController.swift
//  MVCPattern
//
//  Created by Kimaya Desai on 12/20/22.
//

import UIKit

class ViewController: UIViewController {

    var arrData = [FruitModel]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        arrData = FruitData.getFoodData()
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FruitCell.identifier, for: indexPath) as! FruitCell
        cell.foodData = arrData[indexPath.row]
        return cell
    }
}
