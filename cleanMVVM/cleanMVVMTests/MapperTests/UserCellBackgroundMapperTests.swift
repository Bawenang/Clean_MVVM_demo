//
//  UserCellBackgroundMapperTests.swift
//  cleanMVVMTests
//
//  Created by Bawenang RPP on 28/11/21.
//

@testable import cleanMVVM
import XCTest

class UserCellBackgroundMapperTests: XCTestCase {

    func testMap_FromStatusActive() throws {
        let color = UserCellBackgroundMapper.map(from: .active)
        try assertEqual(expectedColors[.active]!, color)
    }
    
    func testMap_FromStatusInactive() throws {
        let color = UserCellBackgroundMapper.map(from: .inactive)
        try assertEqual(expectedColors[.inactive]!, color)
    }
}

private func assertEqual(
    _ expectedColor: @autoclosure () throws -> UIColor?,
    _ actualColor: @autoclosure () throws -> UIColor?,
    line: UInt = #line
) throws {
    guard let expectedColor = try expectedColor(),
          let actualColor = try actualColor() else {
        XCTFail("Expected or actual color is nil!")
        return
    }
    let expectedRGBA = expectedColor.rgba
    let actualRGBA = actualColor.rgba
    
    XCTAssertEqual(expectedRGBA.red, actualRGBA.red, accuracy: 0.01, line: line)
    XCTAssertEqual(expectedRGBA.green, actualRGBA.green, accuracy: 0.01, line: line)
    XCTAssertEqual(expectedRGBA.blue, actualRGBA.blue, accuracy: 0.01, line: line)
    XCTAssertEqual(expectedRGBA.alpha, actualRGBA.alpha, accuracy: 0.01, line: line)

}

private let expectedColors = [
    User.Status.active: UIColor(named: "userActiveBG"),
    User.Status.inactive: UIColor(named: "userInactiveBG")
]

private extension UIColor {
    var rgba: (red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) {
        var red: CGFloat = 0
        var green: CGFloat = 0
        var blue: CGFloat = 0
        var alpha: CGFloat = 0
        getRed(&red, green: &green, blue: &blue, alpha: &alpha)

        return (red, green, blue, alpha)
    }
}
