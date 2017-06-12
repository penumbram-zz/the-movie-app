//
//  MoviesWireframe.swift
//  The Movie App
//
//  Created by Tolga Caner on 01/06/2017.
//  Copyright © 2017 Tolga Caner. All rights reserved.
//

import UIKit

protocol MoviesWireframe : BaseWireframe {
    
    func presentDetails(forMovie movie: Movie)
}


class MoviesRouter : MoviesWireframe
{
    weak var viewController: UIViewController?
    
    static func assembleModule() -> UIViewController {
        let view = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "movies_view_controller") as! MoviesViewController
        let presenter = MoviesPresenter()
        let interactor = MoviesInteractor()
        let router = MoviesRouter()
        
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        presenter.wireframe = router
        interactor.output = presenter
        router.viewController = view
        
        return view
    }
    
    func presentDetails(forMovie movie: Movie) {
        //TODO: show movie details
    }
}
