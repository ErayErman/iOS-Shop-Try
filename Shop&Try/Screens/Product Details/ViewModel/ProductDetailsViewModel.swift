//
//  ProductDetailsViewModel.swift
//  Shop&Try
//
//  Created by Eray on 4.11.2022.
//

import Foundation
import FirebaseFirestore

final class ProductDetailsViewModel{
    
    let results: Product
        
        init(_ results: Product) {
            self.results = results
        }
    
  //  func addBasket() {
  //      do {
  //          guard let data = try coin.dictionary else {
  //              return
  //          }
  //
  //          db.collection("coins").addDocument(data: data) { err in
  //
  //              if let err = err {
  //                  self.delegate?.didErrorOccurred?(err)
  //              } else {
  //                  self.delegate?.didCoinAddedToFavorites?()
  //              }
  //          }
  //      } catch {
  //          delegate?.didErrorOccurred?(error)
  //      }
  //  }
}
