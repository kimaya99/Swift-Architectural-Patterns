//
//  FruitData.swift
//  MVCPattern
//
//  Created by Kimaya Desai on 12/20/22.
//

import UIKit


class FruitData {
    static func getFoodData() -> [FruitModel] {
        var arrData = [FruitModel]()
        arrData = [
            FruitModel(img: UIImage(named: "kiwi")!, titleStr: "kiwi"),
            FruitModel(img: UIImage(named: "orange")! , titleStr: "orange"),
            FruitModel(img: UIImage(named: "blueberries")!, titleStr: "blueberries")
        ]
        return arrData
    }
}
