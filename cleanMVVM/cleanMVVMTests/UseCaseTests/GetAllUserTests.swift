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

    func testGet_WhenFailed_ShouldReturnError() throws {
        let expectedError = randomError()
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

private func randomError() -> NSError {
    return NSError(domain: .random(length: 20), code: .random(in: 1...100), userInfo: nil)
}

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
        .female,
        .other
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
