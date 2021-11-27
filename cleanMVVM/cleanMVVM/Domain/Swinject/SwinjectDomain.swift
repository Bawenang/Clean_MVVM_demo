//
//  SwinjectDomain.swift
//  cleanMVVM
//
//  Created by Bawenang RPP on 27/11/21.
//

import Swinject
import RxSwift

struct SwinjectDomain {
    static var container: Container {
        let container = Container()
        
        container.register(GetAllUser.self) { _ in
            let api = SwinjectData.container.resolve(UserRepositoryInterface.self)!
            return GetAllUser(allUsersProvider: api.retrieveAll)
        }
        
        return container
    }
    
}
