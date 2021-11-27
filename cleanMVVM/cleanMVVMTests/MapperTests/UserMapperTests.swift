//
//  UserMapperTests.swift
//  cleanMVVMTests
//
//  Created by Bawenang RPP on 27/11/21.
//

@testable import cleanMVVM
import XCTest

class UserMapperTests: XCTestCase {
    func testMapAllFromAllUsersResponseModel() throws {
        let responseModel = AllUsersResponseModel(data: [randomUserResponseModel()])
        let actualUser = UserMapper.mapAll(from: responseModel).first
        
        XCTAssertEqual(responseModel.data.first?.id, actualUser?.id)
        XCTAssertEqual(responseModel.data.first?.name, actualUser?.name)
        XCTAssertEqual(responseModel.data.first?.email, actualUser?.email)
        XCTAssertEqual(responseModel.data.first?.gender, actualUser?.gender?.rawValue)
        XCTAssertEqual(responseModel.data.first?.status, actualUser?.status.rawValue)
    }

    func testMapFromUserResponseModel() throws {
        let responseModel = randomUserResponseModel()
        let actualUser = UserMapper.map(from: responseModel)
        
        XCTAssertEqual(responseModel.id, actualUser.id)
        XCTAssertEqual(responseModel.name, actualUser.name)
        XCTAssertEqual(responseModel.email, actualUser.email)
        XCTAssertEqual(responseModel.gender, actualUser.gender?.rawValue)
        XCTAssertEqual(responseModel.status, actualUser.status.rawValue)
    }
    
    func testMapFromUserResponseModel_WithUnknownGenderAndStatus() throws {
        let responseModel = randomUserResponseModelWithUnknownGenderStatus()
        let actualUser = UserMapper.map(from: responseModel)
        
        XCTAssertEqual(responseModel.id, actualUser.id)
        XCTAssertEqual(responseModel.name, actualUser.name)
        XCTAssertEqual(responseModel.email, actualUser.email)
        XCTAssertNil(actualUser.gender)
        XCTAssertEqual(.inactive, actualUser.status)
    }
}

private func randomUserResponseModel() -> UserResponseModel {
    return UserResponseModel(id: .random(in: 1...1000),
                             name: .random(length: 30),
                             email: .randomEmailAddress(length: 8),
                             gender: randomGender(),
                             status: randomStatus())
}

private func randomUserResponseModelWithUnknownGenderStatus() -> UserResponseModel {
    return UserResponseModel(id: .random(in: 1...1000),
                             name: .random(length: 30),
                             email: .randomEmailAddress(length: 8),
                             gender: .random(length: 20),
                             status: .random(length: 25))
}

private func randomGender() -> String {
    [
        "male",
        "female"
    ].randomElement()!
}

private func randomStatus() -> String {
    [
        "active",
        "inactive"
    ].randomElement()!
}
