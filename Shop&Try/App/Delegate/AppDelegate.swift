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
            let onboardingViewController = OnboardingViewController()
            let autViewController = AuthViewController()
        if (UserDefaults.standard.value(forKey: "openedApp") as? Bool) == nil {
            let navigationController = UINavigationController(rootViewController: onboardingViewController)
            window.rootViewController = navigationController
        }else {
            let navigationController = UINavigationController(rootViewController: autViewController)
            window.rootViewController = navigationController

        }
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

