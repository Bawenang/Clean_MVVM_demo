//
//  SwinjectData.swift
//  cleanMVVM
//
//  Created by Bawenang RPP on 27/11/21.
//

import Swinject
import RxSwift

struct SwinjectData {
    static var container: Container {
        let container = Container()
        
        container.register(ApiService.self) { _ in
            return ApiService()
        }
                
        container.register(UserRepositoryInterface.self) { r in
            let api = r.resolve(ApiService.self)!
            return UserRepositoryAdapter(api: api.getAllUsers)
        }
        
        container.register(GetAllUser.self) { r in
            let api = r.resolve(UserRepositoryInterface.self)!
            return GetAllUser(allUsersProvider: api.retrieveAll)
        }
        
        return container
    }
}
