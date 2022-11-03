//
//  ProductsCollectionViewCell.swift
//  Shop&Try
//
//  Created by Eray on 2.11.2022.
//

import UIKit

class ProductsCollectionViewCell: UICollectionViewCell {

    @IBOutlet var productName: UILabel!
    @IBOutlet var image: UIImageView!
    @IBOutlet var priceLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
