//
//  MoviesPresenter.swift
//  The Movie App
//
//  Created by Tolga Caner on 31/05/2017.
//  Copyright © 2017 Tolga Caner. All rights reserved.
//

import Foundation

protocol MoviesModuleInterface : class {
    func fetchMovies(query : String,page : Int)
    func showDetailsForMovie(_ movie: Movie)
}


/*
 * Protocol that defines the commands sent from the Interactor to the Presenter.
 */
protocol MoviesInteractorOutput: class {
    func moviesFetched(movieResponse: MovieResponse)
}

class MoviesPresenter : MoviesModuleInterface, MoviesInteractorOutput
{
    
    // Reference to the View (weak to avoid retain cycle).
    weak var view: MoviesViewInterface!
    
    // Reference to the Interactor's interface.
    var interactor: MoviesInteractorInput!
    
    // Reference to the Router
    var wireframe: MoviesWireframe!
    
    
    //MARK: MoviesModuleInterface
    
    internal func fetchMovies(query: String, page: Int) {
        self.interactor.fetchMovies(query: query, page: page)
    }
    
    func showDetailsForMovie(_ movie: Movie) {
        self.wireframe.presentDetails(forMovie: movie)
    }
    
    //MARK: MoviesInteractorOutput
    
    func moviesFetched(movieResponse: MovieResponse) {
        let movies = movieResponse.results!
        if movies.count > 0 {
        //    self.movies = movies
            self.view.totalPages = movieResponse.totalPages!
            self.view.page = movieResponse.page!
            self.view.showMoviesData(movies)
        } else {
            self.view.showNoContentScreen()
        }
    }
    
    
}
