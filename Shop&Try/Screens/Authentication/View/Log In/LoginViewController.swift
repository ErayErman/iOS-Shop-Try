//
//  LoginViewController.swift
//  Shop&Try
//
//  Created by Eray on 31.10.2022.
//

import UIKit
import FirebaseAuth


class LoginViewController: CAViewController {
    
    @IBOutlet var credentionTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var loginButton: UIButton!
    
    private let viewModel: AuthViewModel
    
    
    // MARK: - Init
    init(viewModel: AuthViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func didClickedLoginButton(_ sender: Any) {
        
        guard let credential = credentionTextField.text,
              let password = passwordTextField.text else {
            return
        }
        
        viewModel.signIn(email: credential,password: password,completion: { [weak self] in guard let self = self else { return }
            
        })
        
    }
    
}
