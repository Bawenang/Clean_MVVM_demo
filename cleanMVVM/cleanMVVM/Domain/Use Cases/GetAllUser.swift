//
//  GetAllUser.swift
//  cleanMVVM
//
//  Created by Bawenang RPP on 26/11/21.
//

import Foundation
import RxSwift

final class GetAllUser {
    private let allUsersProvider: () -> Single<[User]>
    init(allUsersProvider: @escaping () -> Single<[User]>) {
        self.allUsersProvider = allUsersProvider
    }
    
    func get() -> Observable<[User]> {
        return allUsersProvider().asObservable()
    }
}

