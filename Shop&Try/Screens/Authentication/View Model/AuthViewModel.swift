//
//  AuthViewModel.swift
//  Shop&Try
//
//  Created by Eray on 1.11.2022.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore


enum AuthViewModelChange {
    case didErrorOccurred(_ error: Error)
    case didSignUpSuccessful
}

final class AuthViewModel {
    
    var changeHandler: ((AuthViewModelChange) -> Void)?
    let database = Firestore.firestore()
    
    func signUp(email: String, password: String) {
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if let error = error {
                self.changeHandler?(.didErrorOccurred(error))
                return
            }
            self.changeHandler?(.didSignUpSuccessful)
        }
    }
    
    func signIn(email: String,
                password: String,
                completion: @escaping () -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
            if let error = error {
                self.changeHandler?(.didErrorOccurred(error))
                return
            }
            
            completion()
        }
    }
    
    func writeData(username: String, email: String, number: String, favs: [[String: String]]){
        let docRef = database.collection("shop-try/users/user").document("\(email)")
         let user = User(username: username, email: email, number: number, favorites: favs)
        do {
            guard let data = try user.dictionary else {return}
            
            docRef.setData(data) { error in
                
                if let error = error {
                    self.changeHandler?(.didErrorOccurred(error))
                } else {
                    self.changeHandler?(.didSignUpSuccessful)
                }
            }
        } catch {
            self.changeHandler?(.didErrorOccurred(error))
        }
    }
    
}
