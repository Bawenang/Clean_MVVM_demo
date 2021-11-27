//
//  ApiServiceTests.swift
//  cleanMVVMIntegrationTests
//
//  Created by Bawenang RPP on 26/11/21.
//

@testable import cleanMVVM
import XCTest
import RxSwift
import RxBlocking

class ApiServiceTests: XCTestCase {
    private var disposeBag: DisposeBag!

    override func setUpWithError() throws {
        disposeBag = DisposeBag()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testGetAllUsers() throws {
        let dataSource = dataSourceUnderTest()
        
        let result = try dataSource.getAllUsers().toBlocking(timeout: 5).first()
        
        XCTAssertNotNil(result)
    }
}

private func dataSourceUnderTest() -> ApiService {
    return ApiService()
}
