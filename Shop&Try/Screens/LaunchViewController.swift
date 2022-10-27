//
//  LaunchViewController.swift
//  Shop&Try
//
//  Created by Eray on 27.10.2022.
//

import UIKit

class LaunchViewController: UIViewController {

    @IBOutlet var loading: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loading.startAnimating()
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.loading.stopAnimating()
         }
    }

}
