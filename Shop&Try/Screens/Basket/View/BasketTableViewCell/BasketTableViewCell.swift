//
//  BasketTableViewCell.swift
//  Shop&Try
//
//  Created by Eray on 4.11.2022.
//

import UIKit

class BasketTableViewCell: UITableViewCell {
    
    @IBOutlet var productLabel: UILabel!
    @IBOutlet var priceLabel: UILabel!
    @IBOutlet var productImage: UIImageView!
    @IBOutlet var stepperLabel: UILabel!
    @IBOutlet var stepperControl: UIStepper!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    
    }
    @IBAction func stepperChange(_ sender: Any) {
    
    }
    
}
