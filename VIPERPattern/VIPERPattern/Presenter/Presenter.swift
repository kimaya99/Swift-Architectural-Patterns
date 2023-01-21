//
//  Presenter.swift
//  VIPERPattern
//
//  Created by Kimaya Desai on 12/21/22.
//

import Foundation

// object
// protocol
// reference to interactor, router & view

enum FetchError: Error {
    case failed
}

protocol AnyPresenter {
    var router: AnyRouter? { get set }
    var interactor: AnyInteractor? { get set }
    var view: AnyView? { get set }
    
    func interactorDidFetchUsers(with: Result<[User], Error>)
}


class UserPresenter: AnyPresenter {
    func interactorDidFetchUsers(with result: Result<[User], Error>) {
        switch result {
        case.success(let users):
            view?.update(with: users)
        case .failure(_):
            view?.update(with: "Something went wrong")
        }
    }
    
    var router: AnyRouter?
    
    var interactor: AnyInteractor? {
        didSet {
            interactor?.getUsers()
        }
    }
    
    var view: AnyView?
}
