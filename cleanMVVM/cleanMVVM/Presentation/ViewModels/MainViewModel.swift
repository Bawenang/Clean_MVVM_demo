//
//  MainViewModel.swift
//  cleanMVVM
//
//  Created by Bawenang RPP on 27/11/21.
//

import Foundation
import RxSwift
import RxRelay
import RxCocoa

protocol MainViewModelling {
    //Input
    var loadUsers: PublishRelay<Void> { get }

    //Output
    var userParams: Driver<[UserCellViewParam]> { get }
}

class MainViewModel: MainViewModelling {
    let loadUsers = PublishRelay<Void>()
    
    let userParams: Driver<[UserCellViewParam]>
    init(userListProvider: @escaping () -> Single<[User]>) {
        userParams = loadUsers
            .flatMapLatest(userListProvider)
            .map(toUserCellViewParams(from:))
            .asDriver(onErrorJustReturn: [])
    }
}

private func toUserCellViewParams(from users: [User]) -> [UserCellViewParam] {
    return users.map { UserCellViewParamMapper.map(from: $0) }
}
