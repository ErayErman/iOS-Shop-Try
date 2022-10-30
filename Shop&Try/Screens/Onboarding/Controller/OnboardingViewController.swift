//
//  OnboardingViewController.swift
//  Shop&Try
//
//  Created by Eray on 30.10.2022.
//

import UIKit

class OnboardingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func continueTouched(_ sende: UIButton){
        UserDefaults.standard.set(true, forKey: "openedApp")
    }

}
