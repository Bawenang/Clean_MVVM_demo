//
//  UserRepositoryTests.swift
//  cleanMVVMTests
//
//  Created by Bawenang RPP on 27/11/21.
//

@testable import cleanMVVM
import RxSwift
import RxBlocking
import XCTest

class UserRepositoryTests: XCTestCase {
    private var disposeBag: DisposeBag!

    override func setUpWithError() throws {
        disposeBag = DisposeBag()
    }
    
    func testRetrieveAll_WhenSuccessful_ShouldReturnCorrectUser() throws {
        let expectedAllUserResponseModel = AllUsersResponseModel(data: [randomUserResponseModel(id: .random(in: 1..<100)),
                                                                        randomUserResponseModel(id: .random(in: 100..<200))])
        let expectedAllUsers = UserMapper.mapAll(from: expectedAllUserResponseModel)
        let adapter = adapterUnderTest(api: { .just(expectedAllUserResponseModel) })
        
        let actualUsers = try XCTUnwrap(try adapter.retrieveAll().toBlocking(timeout: 0.1).first())
        
        XCTAssertEqual(expectedAllUsers, actualUsers)
    }
    
    func testRetrieveAll_WhenFailed_ShouldThrowError() throws {
        let expectedError = NSError.random()
        let adapter = adapterUnderTest(api: { .error(expectedError) })
                
        XCTAssertThrowsError(try adapter.retrieveAll().toBlocking(timeout: 0.1).first()) {
            let actualError = $0 as NSError
            XCTAssertEqual(expectedError, actualError)
        }
    }

}

private func adapterUnderTest(
    api: @escaping () -> Single<AllUsersResponseModel> = { .just(randomAllUsersResponseModel()) }
) -> UserRepositoryAdapter {
    return UserRepositoryAdapter(api: api)
}

private func randomAllUsersResponseModel(data: [UserResponseModel] = [randomUserResponseModel()]) -> AllUsersResponseModel {
    return AllUsersResponseModel(data: data)
}

private func randomUserResponseModel(id: Int = .random(in: 1...1000)) -> UserResponseModel {
    return UserResponseModel(id: id,
                             name: .random(length: 30),
                             email: .randomEmailAddress(length: 8),
                             gender: User.Gender.random().rawValue,
                             status: User.Status.random().rawValue)
}
