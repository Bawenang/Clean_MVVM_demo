//
//  SwinjectStoryboard.swift
//  cleanMVVM
//
//  Created by Bawenang RPP on 28/11/21.
//

import Swinject
import SwinjectStoryboard

extension SwinjectStoryboard {
    static func setup() {
        Container.loggingFunction = nil
        setupViewModels()
        setupViewControllers()
    }
}

extension SwinjectStoryboard {
    class func setupViewControllers() {
        defaultContainer.storyboardInitCompleted(MainViewController.self) { (r, c) in
            c.viewModel = r.resolve(MainViewModelling.self)!
        }
    }
    class func setupViewModels() {
        defaultContainer.register(MainViewModelling.self) { _ in
            let getAllUserUseCase = SwinjectDomain.container.resolve(GetAllUsersUseCase.self)!
            return MainViewModel(userListProvider: getAllUserUseCase.get)
        }
    }
}
