//
//  AvatarMapperTests.swift
//  cleanMVVMTests
//
//  Created by Bawenang RPP on 28/11/21.
//

@testable import cleanMVVM
import XCTest

class AvatarImagesTests: XCTestCase {
    func testAvatarImagesMale() throws {
        let avatar = avatarImages["male"]
        
        let actualAvatar = try XCTUnwrap(avatar)
        XCTAssertNotNil(actualAvatar)
    }

    func testAvatarImagesFemale() throws {
        let avatar = avatarImages["female"]
        
        let actualAvatar = try XCTUnwrap(avatar)
        XCTAssertNotNil(actualAvatar)
    }
    
    func testAvatarImagesUnknown() throws {
        let avatar = avatarImages[.random(length: 50)]

        XCTAssertNil(avatar)
    }
}

class AvatarMapperTests: XCTestCase {
    func testMap_FromGenderMale() throws {
        let avatar = AvatarMapper.map(from: .male)
        
        XCTAssertNotNil(avatar)
        XCTAssertTrue(avatarImages["male"]! === avatar)
    }

    func testMap_FromGenderFemale() throws {
        let avatar = AvatarMapper.map(from: .female)
        
        XCTAssertNotNil(avatar)
        XCTAssertTrue(avatarImages["female"]! === avatar)
    }
    
    func testMap_FromGenderUnknown() throws {
        let avatar = AvatarMapper.map(from: nil)
        
        XCTAssertNil(avatar)
    }
}
