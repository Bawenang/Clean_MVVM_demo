//
//  GetAllUsers.swift
//  cleanMVVM
//
//  Created by Bawenang RPP on 26/11/21.
//

import Foundation
import RxSwift

final class GetAllUsersImpl: GetAllUsersUseCase {
    private let allUsersProvider: () -> Single<[User]>
    init(allUsersProvider: @escaping () -> Single<[User]>) {
        self.allUsersProvider = allUsersProvider
    }
    
    func get() -> Single<[User]> {
        return allUsersProvider()
    }
}
