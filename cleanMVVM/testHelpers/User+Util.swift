//
//  User+Util.swift
//  cleanMVVM
//
//  Created by Bawenang RPP on 27/11/21.
//

@testable import cleanMVVM
import Foundation

extension User: Equatable {
    public static func == (lhs: User, rhs: User) -> Bool {
        return lhs.id == rhs.id &&
            lhs.name == rhs.name &&
            lhs.email == rhs.email &&
            lhs.gender == rhs.gender &&
            lhs.status == rhs.status
    }
    
    static func random() -> User {
        return User(id: .random(in: 1...1000),
                    name: .random(length: 30),
                    email: .randomEmailAddress(length: 30),
                    gender: .random(),
                    status: .random())
    }
}

extension User.Gender: CaseIterable {
    public static var allCases: [User.Gender] = [
        .male,
        .female
    ]
    
    static func random() -> User.Gender {
        return allCases.randomElement()!
    }
}

extension User.Status: CaseIterable {
    public static var allCases: [User.Status] = [
        .active,
        .inactive
    ]
    
    static func random() -> User.Status {
        return allCases.randomElement()!
    }
}
