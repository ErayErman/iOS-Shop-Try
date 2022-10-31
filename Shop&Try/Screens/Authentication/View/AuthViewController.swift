//
//  AuthViewController.swift
//  Shop&Try
//
//  Created by Eray on 31.10.2022.
//

import UIKit

class AuthViewController: UIViewController {

    @IBOutlet var loginButton: UIButton!
    @IBOutlet var signupButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
    }

    
// MARK: - LOGIN AND SIGN UP
    @IBAction func didClickedLogin(_ sender: Any) {
        let loginVC = LoginViewController()
        navigationController?.pushViewController(loginVC, animated: true)
    }
    
    @IBAction func didClickedSignUp(_ sender: Any) {
        let signVC = SignUpViewController()
        navigationController?.pushViewController(signVC, animated: true)
    }
}
