//
//  UserMapper.swift
//  cleanMVVM
//
//  Created by Bawenang RPP on 27/11/21.
//

import Foundation

struct UserMapper {
    static func mapAll(from responseModel: AllUsersResponseModel) -> [User] {
        return responseModel.data.map(UserMapper.map(from:))
    }
    
    static func map(from responseModel: UserResponseModel) -> User {
        return User(id: responseModel.id,
                    name: responseModel.name,
                    email: responseModel.email,
                    gender: User.Gender(rawValue: responseModel.gender),
                    status: User.Status(rawValue: responseModel.status))
    }
}
