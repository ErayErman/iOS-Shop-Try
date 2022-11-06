//
//  ProfileViewController.swift
//  Shop&Try
//
//  Created by Eray on 1.11.2022.
//

import UIKit
import FirebaseFirestore

class ProfileViewController: UIViewController {

    @IBOutlet var basketButton: UIButton!
    @IBOutlet var usernameLabel: UILabel!
    @IBOutlet var phoneLabel: UILabel!
    @IBOutlet var mailLabel: UILabel!
    @IBOutlet var signOutButton: UIButton!
    
    private var viewModel : ProfileViewModel
    private let database = Firestore.firestore()


    init(viewModel: ProfileViewModel ) {
            self.viewModel = viewModel
            super.init(nibName: nil, bundle: nil)
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
    }
    
    func getData(){
        let docRef = database.collection("shop-try/users/user").document(viewModel.email)
        
        docRef.addSnapshotListener { (documentSnapshot, error) in
            guard let document = documentSnapshot else {
                print("Error fetching document: \(error!)")
                return
            }
            guard let data = document.data() else {
                print("Document data was empty.")
                return
            }
            self.mailLabel.text = self.viewModel.email
            self.usernameLabel.text = data["username"] as? String
            self.phoneLabel.text = data["number"] as? String
            
        }
    }
    @IBAction func showBasket(_ sender: Any) {
        let vm = BasketViewModel(viewModel.email)
        let vc = BasketViewController(viewModel: vm)
        navigationController?.present(vc, animated: true)
    }
    
    
    @IBAction func didClickedSignOut(_ sender: Any) {
        let autVC = AuthViewController()
        navigationController?.pushViewController(autVC, animated: true)
    }
}
