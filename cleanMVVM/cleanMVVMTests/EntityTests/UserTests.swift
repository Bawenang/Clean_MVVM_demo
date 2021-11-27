//
//  UserTests.swift
//  cleanMVVMTests
//
//  Created by Bawenang RPP on 27/11/21.
//

@testable import cleanMVVM
import XCTest

class UserTests: XCTestCase {
    func testGenderMale() throws {
        let gender = User.Gender(rawValue: "male")
        XCTAssertEqual(.male, gender)
    }
    
    func testGenderFemale() throws {
        let gender = User.Gender(rawValue: "female")
        XCTAssertEqual(.female, gender)
    }
    
    func testGenderUnknown() throws {
        let gender = User.Gender(rawValue: .random(length: 20))
        XCTAssertNil(gender)
    }
    
    func testStatusActive() throws {
        let status = User.Status(rawValue: "active")
        XCTAssertEqual(.active, status)
    }
    
    func testStatusInactive() throws {
        let status = User.Status(rawValue: "inactive")
        XCTAssertEqual(.inactive, status)
    }
    
    func testStatusUnknown() throws {
        let status = User.Status(rawValue: .random(length: 20))
        XCTAssertNil(status)
    }
}
