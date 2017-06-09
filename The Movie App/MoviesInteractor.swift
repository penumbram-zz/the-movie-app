//
//  MoviesInteractor.swift
//  The Movie App
//
//  Created by Tolga Caner on 31/05/2017.
//  Copyright © 2017 Tolga Caner. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper

/*
 * Protocol that defines the Interactor's use case.
 */
protocol MoviesInteractorInput: class {
    func fetchMovies()
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
    
    func fetchMovies() {
        NetworkManager.sharedInstance.request(url, method: .get, parameters: ["api_key" : apiKey, "query" : "batman"]).responseObject { (response: DataResponse<MovieResponse>) in
            if let movieResponse = response.result.value {
                //TODO: make it into Movie object instead of NSDictionary
                self.output.moviesFetched(movies: movieResponse.results!)
            }
        }
    }
    
}
