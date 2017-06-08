//
//  MoviesPresenter.swift
//  The Movie App
//
//  Created by Tolga Caner on 31/05/2017.
//  Copyright © 2017 Tolga Caner. All rights reserved.
//

import Foundation

/*
 * Protocol that defines the commands sent from the View to the Presenter.
 */
protocol MoviesModuleInterface: class {
    func updateView()
    func showDetailsForMovie(_ movie: Movie)
}


/*
 * Protocol that defines the commands sent from the Interactor to the Presenter.
 */
protocol MoviesInteractorOutput: class {
    func moviesFetched(movies: [Movie])
}

class MoviesPresenter : MoviesModuleInterface, MoviesInteractorOutput
{
    // Reference to the View (weak to avoid retain cycle).
    weak var view: MoviesViewInterface!
    
    // Reference to the Interactor's interface.
    var interactor: MoviesInteractorInput!
    
    var wireframe: MoviesWireframe!
    
    
    //MARK: MoviesModuleInterface
    
    func updateView() {
        self.interactor.fetchMovies()
    }
    
    func showDetailsForMovie(_ movie: Movie) {
        self.wireframe.presentDetails(forMovie: movie)
    }
    
    //MARK: MoviesInteractorOutput
    
    func moviesFetched(movies: [Movie]) {
        if movies.count > 0 {
        //    self.movies = movies
            self.view.showMoviesData(movies)
        } else {
            self.view.showNoContentScreen()
        }
    }
}
