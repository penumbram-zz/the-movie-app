//
//  SearchRouter.swift
//  The Movie App
//
//  Created by Tolga Caner on 09/06/2017.
//  Copyright © 2017 Tolga Caner. All rights reserved.
//

import Foundation

import UIKit

protocol SearchWireframe: BaseWireframe {
    
    func presentMovies(forQuery : String)
}


class SearchRouter : SearchWireframe {
    
    weak var viewController: UIViewController?
    
    static func assembleModule() -> UIViewController {
        
        let viewController = SearchViewController(nibName: "SearchViewController", bundle: Bundle.main)

        let presenter = SearchPresenter()
        let interactor = SearchInteractor()
        let router = SearchRouter()
        
        let navigation = UINavigationController(rootViewController: viewController)

        viewController.presenter = presenter
        presenter.view = viewController
        presenter.interactor = interactor
        presenter.wireframe = router
        interactor.output = presenter
        
        router.viewController = viewController
        return navigation
    }
    
    internal func presentMovies(forQuery query: String) {
        let moviesModuleViewController = MoviesRouter.assembleModule() as! MoviesViewController
        moviesModuleViewController.query = query
        viewController?.navigationController?.pushViewController(moviesModuleViewController, animated: true)
    }
}
