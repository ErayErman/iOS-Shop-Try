//
//  BasketViewModel.swift
//  Shop&Try
//
//  Created by Eray on 5.11.2022.
//

import Foundation
import FirebaseFirestore

protocol BasketViewModelDelegate: AnyObject {
    func didErrorOccurred(_ error: Error)
    func didGetData()
}

protocol BasketViewModelProtocol {
    var delegate: BasketViewModelDelegate? {get set}
    var numberOfRows: Int {get}
    func getData()
    var email: String {get}
    var addedData: [[String : String]] {get}
    
}

final class BasketViewModel: BasketViewModelProtocol {
  
    
    weak var delegate: BasketViewModelDelegate?

    let email: String
    
    init(_ email: String) {
        self.email = email
    }
    
    var addedData = [[String : String]]() {
        didSet {
            delegate?.didGetData()
        }
    }
    
    var database = Firestore.firestore()
        
    var numberOfRows: Int {
        addedData.count
        
    }
    
    func getData(){
        let docRef = database.collection("shop-try/users/user").document(email)
        docRef.addSnapshotListener { (documentSnapshot, error) in
            guard let document = documentSnapshot else {
                self.delegate?.didErrorOccurred(error!)
                return
            }
            guard let data = document.data() else {
                print("Document data was empty.")
                return
            }
            do {
                let addedData = data["favorites"] as! [[String : String]]
                self.addedData = addedData
            }

        }
    
    }
}
