//
//  UserRepository.swift
//  cleanMVVM
//
//  Created by Bawenang RPP on 27/11/21.
//

import Foundation
import RxSwift

class UserRepositoryAdapter: UserRepositoryInterface {
    private let api: () -> Single<AllUsersResponseModel>
    init(api: @escaping () -> Single<AllUsersResponseModel>) {
        self.api = api
    }
    
    func retrieveAll() -> Single<[User]> {
        return api()
            .map(UserMapper.mapAll(from:))
    }
}
