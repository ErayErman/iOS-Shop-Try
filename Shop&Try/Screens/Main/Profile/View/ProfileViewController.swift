//
//  ProfileViewController.swift
//  Shop&Try
//
//  Created by Eray on 1.11.2022.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet var usernameLabel: UILabel!
    @IBOutlet var phoneLabel: UILabel!
    @IBOutlet var mailLabel: UILabel!
    @IBOutlet var basketButton: UIButton!
    @IBOutlet var signOutButton: UIButton!
    
    private var viewModel : ProfileVM

    init(viewModel: ProfileVM ) {
            self.viewModel = viewModel
            super.init(nibName: nil, bundle: nil)
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func didClickedBasketButton(_ sender: Any) {
    }
    
    @IBAction func didClickedSignOut(_ sender: Any) {
        let autVC = AuthViewController()
        navigationController?.pushViewController(autVC, animated: true)
    }
}
