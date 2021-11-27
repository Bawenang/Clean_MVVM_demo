//
//  User.swift
//  cleanMVVM
//
//  Created by Bawenang RPP on 26/11/21.
//

import Foundation

struct User {
    enum Gender: String {
        case male = "male"
        case female = "female"
    }
    
    enum Status: String {
        case active = "active"
        case inactive = "inactive"
    }
    
    let id: Int
    let name: String
    let email: String
    let gender: Gender?
    let status: Status
    
    init(id: Int,
         name: String,
         email: String,
         gender: Gender?,
         status: Status?) {
        self.id = id
        self.name = name
        self.email = email
        self.gender = gender
        self.status = status ?? .inactive
    }
}
