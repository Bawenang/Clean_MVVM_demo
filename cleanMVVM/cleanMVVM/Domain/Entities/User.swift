//
//  User.swift
//  cleanMVVM
//
//  Created by Bawenang RPP on 26/11/21.
//

import Foundation

struct User {
    enum Gender {
        case male
        case female
        case other
    }
    enum Status {
        case active
        case inactive
    }
    
    let id: Int
    let name: String
    let email: String
    let gender: Gender
    let status: Status
}
