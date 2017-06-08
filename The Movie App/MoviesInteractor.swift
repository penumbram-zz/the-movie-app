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
    // Url to the desired API.
    let apiKey = "2696829a81b1b5827d515ff121700838"
    let url = "http://api.themoviedb.org/3/search/movie"
    
    // Reference to the Presenter's output interface.
    weak var output: MoviesInteractorOutput!
    
    var afManager : SessionManager!
    init() {
        let configuration = URLSessionConfiguration.default
        var headers : [AnyHashable : Any] = Alamofire.SessionManager.defaultHTTPHeaders
        headers.updateValue("application/json, application/x-www-form-urlencoded, */*", forKey: "Accept")
        headers.updateValue("application/json", forKey: "Content-Type")
        configuration.httpAdditionalHeaders = headers
        afManager = Alamofire.SessionManager(configuration: configuration)
        //Alamofire.Manager.sharedInstance.session.configuration
        //    .HTTPAdditionalHeaders?.updateValue("application/json",
        //                                        forKey: "Accept")
    }
    
    
    // MARK: MoviesInteractorInput
    
    func fetchMovies() {
        afManager.request(url, method: .get, parameters: ["api_key" : apiKey, "query" : "batman"], encoding: URLEncoding.default).responseObject { (response: DataResponse<MovieResponse>) in
            if let movieResponse = response.result.value {
                //TODO: make it into Movie object instead of NSDictionary
                self.output.moviesFetched(movies: movieResponse.results!)
            }
        }
    }
    
}
