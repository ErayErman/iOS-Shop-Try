//
//  AppDelegate.swift
//  Shop&Try
//
//  Created by Eray on 27.10.2022.
//

import UIKit
import FirebaseCore
import IQKeyboardManagerSwift
import FirebaseFirestore

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        FirebaseApp.configure()
        _ = Firestore.firestore()
        setupWindow()
        setupKeyboardManager()
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
    
    private func setupKeyboardManager() {
        let keyboardManager = IQKeyboardManager.shared
        keyboardManager.enable = true
        keyboardManager.shouldResignOnTouchOutside = true
        keyboardManager.toolbarDoneBarButtonItemText = "Done"
        keyboardManager.toolbarTintColor = .black
    }

}

