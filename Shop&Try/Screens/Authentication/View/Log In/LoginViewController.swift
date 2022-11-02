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
        navigationItem.hidesBackButton = true

    }
    
    @IBAction func didClickedLoginButton(_ sender: Any) {
        
        guard let credential = credentionTextField.text,
              let password = passwordTextField.text else {
            return
        }
        
        viewModel.signIn(email: credential,password: password,completion: { [weak self] in
            guard let self = self else { return }
            
            let productsViewModel = ProductsVM()
            let productsViewController = ProductsViewController(viewModel: productsViewModel)
                            
            productsViewController.title = "Products"

            productsViewController.tabBarItem.image = UIImage(named: "house")
            productsViewController.tabBarItem.selectedImage = UIImage(named: "house_fill")

            
            let searchViewModel = SearchVM()
            let searchViewController = SearchViewController(viewModel: searchViewModel)
            searchViewController.title = "Search"
            searchViewController.tabBarItem.image = UIImage(named: "Magnifyingglass Circle")
            searchViewController.tabBarItem.selectedImage = UIImage(named: "Magnifyingglass Circle_Fill")
            
            let profileViewModel = ProfileVM()
            let profileViewController = ProfileViewController(viewModel: profileViewModel)
            profileViewController.title = "Profile"
            profileViewController.tabBarItem.image = UIImage(named: "PersonCropSquare")
            profileViewController.tabBarItem.selectedImage = UIImage(named: "PersonCropSquare_Fill")
            
            let tabBarController = UITabBarController()
            tabBarController.viewControllers = [productsViewController, searchViewController,profileViewController]
            tabBarController.navigationItem.hidesBackButton = true
            self.navigationController?.pushViewController(tabBarController, animated: true)
            
        })
        
    }
    
}
