//
//  ProfileViewController.swift
//  Shop&Try
//
//  Created by Eray on 1.11.2022.
//

import UIKit

class ProfileViewController: UIViewController {

    @IBOutlet var basketButton: UIButton!
    @IBOutlet var usernameLabel: UILabel!
    @IBOutlet var phoneLabel: UILabel!
    @IBOutlet var mailLabel: UILabel!
    @IBOutlet var signOutButton: UIButton!
    
    private var viewModel : ProfileViewModel

    init(viewModel: ProfileViewModel ) {
            self.viewModel = viewModel
            super.init(nibName: nil, bundle: nil)
        }
        
        required init?(coder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func showBasket(_ sender: Any) {
        let vm = BasketViewModel()
        let vc = BasketViewController(viewModel: vm)
        navigationController?.present(vc, animated: true)
    }
    
    
    @IBAction func didClickedSignOut(_ sender: Any) {
        let autVC = AuthViewController()
        navigationController?.pushViewController(autVC, animated: true)
    }
}
