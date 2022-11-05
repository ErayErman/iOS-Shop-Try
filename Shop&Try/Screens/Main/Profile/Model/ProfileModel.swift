//
//  ProfileModel.swift
//  Shop&Try
//
//  Created by Eray on 5.11.2022.
//

import Foundation

struct User: Encodable {
    let username: String?
    let email: String?
    let number: String?
    let favorites: [[String:String]]?
}

extension User {
    init(from dict: [String: Any]) {
        username = dict["Username"] as? String
        email = dict["Email"] as? String
        number = dict["Phone Number"] as? String
        favorites = dict["Fav"] as? [[String:String]]
    }
}
