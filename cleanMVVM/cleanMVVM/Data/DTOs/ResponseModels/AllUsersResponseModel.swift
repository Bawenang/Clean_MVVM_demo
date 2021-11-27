//
//  AllUsersResponseModel.swift
//  cleanMVVM
//
//  Created by Bawenang RPP on 26/11/21.
//

import Foundation

struct AllUsersResponseModel: Decodable {
    let data: [UserResponseModel]
}
