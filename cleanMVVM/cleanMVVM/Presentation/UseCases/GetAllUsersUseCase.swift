//
//  GetAllUsersUseCase.swift
//  cleanMVVM
//
//  Created by Bawenang RPP on 29/11/21.
//

import Foundation
import RxSwift

protocol GetAllUsersUseCase {
    func get() -> Single<[User]>
}
