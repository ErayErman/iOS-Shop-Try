//
//  OnboardingViewController.swift
//  Shop&Try
//
//  Created by Eray on 30.10.2022.
//

import UIKit

class OnboardingViewController: UIViewController {

    @IBOutlet var skip: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
    }
    
    @IBAction func continueTouched(_ sende: UIButton){
        UserDefaults.standard.set(true, forKey: "openedApp")
    }

    @IBAction func didClickedSkipButton(_ sender: Any) {
        let authVC = AuthViewController()
        navigationController?.pushViewController(authVC, animated: true)
    }
}
