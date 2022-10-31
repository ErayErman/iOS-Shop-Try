//
//  AppDelegate.swift
//  Shop&Try
//
//  Created by Eray on 27.10.2022.
//

import UIKit
import FirebaseCore

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()
        setupWindow()
        return true
    }

    private func setupWindow() {
            let window = UIWindow(frame: UIScreen.main.bounds)
            //let viewModel = AuthViewModel()
            let viewController = OnboardingViewController()
            let navigationController = UINavigationController(rootViewController: viewController)
            window.rootViewController = navigationController
            window.makeKeyAndVisible()
            self.window = window
        }

}
