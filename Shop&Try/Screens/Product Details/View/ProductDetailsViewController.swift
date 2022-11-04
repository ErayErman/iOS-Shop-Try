//
//  ProductDetailsViewController.swift
//  Shop&Try
//
//  Created by Eray on 4.11.2022.
//

import UIKit
import AlamofireImage

class ProductDetailsViewController: UIViewController {

    @IBOutlet var imageView: UIImageView!
    @IBOutlet var nameLabel: UILabel?
    @IBOutlet var priceLabel: UILabel!
    @IBOutlet var stepperLabel: UILabel?
    @IBOutlet var stepperControl: UIStepper!
    @IBOutlet var piecesLabel: UILabel?
    @IBOutlet var addButton: UIButton!
    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var ratingLabel: UILabel!
    
    var productDetailsViewModel : ProductDetailsViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
    }
    private func setupUI(){
        
        self.nameLabel?.text = productDetailsViewModel?.results.title
        self.priceLabel?.text = "Price \(productDetailsViewModel?.results.price ?? 0.0)"
        self.descriptionLabel.text = productDetailsViewModel?.results.welcomeDescription
        self.ratingLabel.text = "Rating: \(productDetailsViewModel?.results.rating?.rate ?? 0.0)"
        self.piecesLabel?.text = "Pieces: \(productDetailsViewModel?.results.rating?.count ?? 0)"
        
        // Image settings
        guard let urlString: String = productDetailsViewModel?.results.image else { return }
        let url = URL(string: urlString)!
        self.imageView.af.setImage(withURL: url)
        
        
        stepperControl.wraps = true
        stepperControl.autorepeat = true
        stepperControl.maximumValue = Double(productDetailsViewModel?.results.rating?.count ?? 0)
    }
    
    @IBAction func didClickedAddButton(_ sender: Any) {
        
    }
    
    @IBAction func stepperCounter(_ sender: Any) {
        stepperLabel?.text = Int(stepperControl.value).description
    }
}
