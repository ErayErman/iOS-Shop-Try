//
//  ViewController.swift
//  Shop&Try
//
//  Created by Eray on 30.10.2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let onboardingController = OnboardingViewController()
        navigationController?.pushViewController(onboardingController, animated: true)
    }
    

}
