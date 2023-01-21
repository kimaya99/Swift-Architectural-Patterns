//
//  FoodCell.swift
//  MVCPattern
//
//  Created by Kimaya Desai on 12/20/22.
//

import UIKit

class FruitCell: UICollectionViewCell {
    
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var lbl: UILabel!
    
    
    
    
    var foodData: FruitModel? {
        didSet {
            img.image = foodData?.img
            lbl.text = foodData?.titleStr
        }
    }
}

extension UICollectionViewCell {
    static var identifier: String {
        return String(describing: self)
    }
}
