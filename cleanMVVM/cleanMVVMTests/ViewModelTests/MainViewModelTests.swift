//
//  MainViewModelTests.swift
//  cleanMVVMTests
//
//  Created by Bawenang RPP on 28/11/21.
//

@testable import cleanMVVM
import XCTest
import RxSwift
import RxBlocking
import RxCocoa

class MainViewModelTests: XCTestCase {
    private var disposeBag: DisposeBag!

    override func setUpWithError() throws {
        disposeBag = DisposeBag()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testLoadUsers_WhenSuccessful_ShouldReturnUserCellViewParams() throws {
        let expectedUsers: [User] = [.random(), .random()]
        let expectedUserCellViewParams = expectedUsers.map { UserCellViewParamMapper.map(from: $0) }
        let viewModel = viewModelUnderTest(userListProvider: { .just(expectedUsers) })
        
        var emittedUserCellViewParams: [UserCellViewParam]?
        viewModel.userParams
            .drive(onNext: { emittedUserCellViewParams = $0 })
            .disposed(by: disposeBag)
        
        viewModel.loadUsers.accept(())
        let actualUserCellViewParams = try XCTUnwrap(emittedUserCellViewParams)
        
        XCTAssertEqual(expectedUserCellViewParams, actualUserCellViewParams)
    }

    func testLoadUsers_WhenFailed_ShouldReturnEmpty() throws {
        let viewModel = viewModelUnderTest(userListProvider: { .error(NSError.random()) })
        
        var emittedUserCellViewParams: [UserCellViewParam]?
        viewModel.userParams
            .drive(onNext: { emittedUserCellViewParams = $0 })
            .disposed(by: disposeBag)
        
        viewModel.loadUsers.accept(())
        let actualUserCellViewParams = try XCTUnwrap(emittedUserCellViewParams)

        XCTAssertTrue(actualUserCellViewParams.isEmpty)
    }
}

private func viewModelUnderTest(
    userListProvider: @escaping () -> Single<[User]> = { .just([.random()]) }
) -> MainViewModel {
    return MainViewModel(userListProvider: userListProvider)
}

