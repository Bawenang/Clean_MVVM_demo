//
//  UserResponseModel.swift
//  cleanMVVM
//
//  Created by Bawenang RPP on 26/11/21.
//

import Foundation

struct UserResponseModel: Decodable {
    let id: Int
    let name: String
    let email: String
    let gender: String
    let status: String
}
