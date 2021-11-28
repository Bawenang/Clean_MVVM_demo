//
//  AvatarMapperTests.swift
//  cleanMVVMTests
//
//  Created by Bawenang RPP on 28/11/21.
//

@testable import cleanMVVM
import XCTest

class AvatarMapperTests: XCTestCase {
    
    func testMap_FromGenderMale() throws {
        let avatar = AvatarMapper.map(from: .male)
        
        XCTAssertNotNil(avatar)
        XCTAssertTrue(expectedImages[.male]! == avatar)
    }

    func testMap_FromGenderFemale() throws {
        let avatar = AvatarMapper.map(from: .female)
        
        XCTAssertNotNil(avatar)
        XCTAssertTrue(expectedImages[.female]! == avatar)
    }
    
    func testMap_FromGenderUnknown() throws {
        let avatar = AvatarMapper.map(from: nil)
        
        XCTAssertNil(avatar)
    }
}

private let expectedImages = [
    User.Gender.male: UIImage.init(named: "maleAvatar"),
    User.Gender.female: UIImage.init(named: "femaleAvatar")
]
