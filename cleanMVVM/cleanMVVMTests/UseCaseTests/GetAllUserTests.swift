//
//  GetAllUserTests.swift
//  cleanMVVMTests
//
//  Created by Bawenang RPP on 26/11/21.
//

@testable import cleanMVVM
import XCTest
import RxSwift
import RxBlocking

class GetAllUserTests: XCTestCase {
    private var disposeBag: DisposeBag!

    override func setUpWithError() throws {
        disposeBag = DisposeBag()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testGet_WhenSuccessful_ShouldReturnUsers() throws {
        let expectedUsers: [User] = [.random(), .random()]
        let useCase = useCaseUnderTest(allUsersProvider: { .just(expectedUsers) })
        
        let actualUsers = try useCase.get().toBlocking(timeout: 0.1).first()
        
        XCTAssertEqual(expectedUsers, actualUsers)
    }

    func testGet_WhenFailed_ShouldThrowError() throws {
        let expectedError = NSError.random()
        let useCase = useCaseUnderTest(allUsersProvider: { .error(expectedError) })
        
        XCTAssertThrowsError(try useCase.get().toBlocking(timeout: 0.1).first()) {
            let actualError = $0 as NSError
            XCTAssertEqual(expectedError, actualError)
        }
    }
}

private func useCaseUnderTest(
    allUsersProvider: @escaping () -> Single<[User]> = { .just([.random()]) }
) -> GetAllUser {
    return GetAllUser(allUsersProvider: allUsersProvider)
}
