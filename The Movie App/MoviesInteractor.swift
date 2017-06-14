//
//  MoviesInteractor.swift
//  The Movie App
//
//  Created by Tolga Caner on 31/05/2017.
//  Copyright © 2017 Tolga Caner. All rights reserved.
//

import Foundation

/*
 * Protocol that defines the Interactor's use case.
 */
protocol MoviesInteractorInput: class {
    func fetchMovies(query : String,page : Int)
    func saveQuery(_ query: String)
}


/*
 * The Interactor responsible for implementing
 * the business logic of the module.
 */
class MoviesInteractor : MoviesInteractorInput
{
    
    // Reference to the Presenter's output interface.
    weak var output: MoviesInteractorOutput!
    
    // MARK: MoviesInteractorInput
    func fetchMovies(query : String,page : Int) {
        SearchCommand(query: query, page: page) {(movieResponse : MovieResponse) in
            self.output.moviesFetched(movieResponse: movieResponse)
        }.execute()
    }
    
    func saveQuery(_ query: String) {
        do {
            try SuggestionsLocalDataManager.saveSuggestion(query: query)
        } catch  {
            print(error.localizedDescription)
        }
    }
    
}
