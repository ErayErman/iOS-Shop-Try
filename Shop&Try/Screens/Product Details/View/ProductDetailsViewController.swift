//
//  ProductDetailsViewController.swift
//  Shop&Try
//
//  Created by Eray on 4.11.2022.
//

import UIKit
import AlamofireImage
import FirebaseFirestore

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
    let database = Firestore.firestore()
    var addedData = [Any]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        getData()
        
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
    
    func getData(){
        let docRef = database.collection("shop-try/users/user").document(productDetailsViewModel?.email ?? "")
        
        docRef.addSnapshotListener { (documentSnapshot, error) in
            guard let document = documentSnapshot else {
                print("Error fetching document: \(error!)")
                return
            }
            guard let data = document.data() else {
                print("Document data was empty.")
                return
            }
            self.addedData = data["favorites"] as! [Any]
        }
    }
    
    @IBAction func didClickedAddButton(_ sender: Any) {
        guard let urlString: String = productDetailsViewModel?.results.image else { return }
        let data = ["name": nameLabel?.text, "price": priceLabel?.text, "count": Int(stepperControl.value).description, "image":urlString ]
        var copyData = [Any]()
        copyData = self.addedData
        copyData.append(data)
        
        let docRef = database.collection("shop-try/users/user").document(productDetailsViewModel?.email ?? " ")
            
            // Update Data
            docRef.updateData(["favorites" : copyData]){
                err in
                if let err = err {
                    print("Error updating document: \(err)")
                } else {
                    print("Document successfully updated")
                }
            }
        }
    
    @IBAction func stepperCounter(_ sender: Any) {
        stepperLabel?.text = Int(stepperControl.value).description
    }
}
