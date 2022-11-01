//
//  SignUpViewController.swift
//  Shop&Try
//
//  Created by Eray on 31.10.2022.
//

import UIKit
import FirebaseAuth


class SignUpViewController: CAViewController {

    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var numberTextField: UITextField!
    @IBOutlet var credentionTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var signUpButton: UIButton!
    
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
        
        viewModel.changeHandler = { change in
            switch change {
            case .didErrorOccurred(let error):
                self.showError(error)
            case .didSignUpSuccessful:
                self.showAlert(title: "SIGN UP SUCCESSFUL!")
            }
        }

    }

    @IBAction func didClickedSignUp(_ sender: Any) {
        guard let credential = credentionTextField.text,
              let password = passwordTextField.text else {
            return
        }
        viewModel.signUp(email: credential, password: password)
        
    }
    
}
