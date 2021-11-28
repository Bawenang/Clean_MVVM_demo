//
//  UserCellViewParamMapperTests.swift
//  cleanMVVMTests
//
//  Created by Bawenang RPP on 28/11/21.
//

@testable import cleanMVVM
import XCTest

class UserCellViewParamMapperTests: XCTestCase {

    func testMapFromUser() throws {
        let expectedUser = User.random()
        let actualViewParam = UserCellViewParamMapper.map(from: expectedUser)
        
        XCTAssertEqual(expectedUser.id, actualViewParam.id)
        XCTAssertEqual(expectedUser.name, actualViewParam.name)
        XCTAssertEqual(expectedUser.email, actualViewParam.email)
        XCTAssertEqual(AvatarMapper.map(from: expectedUser.gender), actualViewParam.avatar)
        XCTAssertEqual(UserCellBackgroundMapper.map(from: expectedUser.status), actualViewParam.statusColor)
    }

}
