//
//  Router.swift
//  VIPERPattern
//
//  Created by Kimaya Desai on 12/21/22.
//

import UIKit
// Object
// Routes betn modules
// Entry point of module


typealias EntryPoint  = AnyView & UIViewController

protocol AnyRouter {
    var entry: EntryPoint? { get }
    
    static func start() -> AnyRouter
}


class UserRouter: AnyRouter {
    var entry: EntryPoint?
    
    static func start() -> AnyRouter {
        let router = UserRouter()
        
        var view: AnyView = UserView()
        var presenter: AnyPresenter = UserPresenter()
        var intercator: AnyInteractor = UserInteractor()
        
        view.presentor = presenter
        
        intercator.presentor = presenter
        
        presenter.router = router
        presenter.view = view
        presenter.interactor = intercator
        
        router.entry = view as? EntryPoint
        
        
        return router
    }
    
    
}
