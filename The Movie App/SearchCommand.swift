//
//  SearchCommand.swift
//  The Movie App
//
//  Created by Tolga Caner on 11/06/2017.
//  Copyright © 2017 Tolga Caner. All rights reserved.
//

import Alamofire
import AlamofireObjectMapper

protocol Command {
    func execute()
}

class SearchCommand : Command {
    let query:String
    var page : Int
    var completionHandler: (MovieResponse) -> Void
    
    required init(query: String,page : Int, completionHandler: @escaping (MovieResponse)->Void) {
        self.query = query
        self.page = page
        self.completionHandler = completionHandler
    }
    
    func execute() {
        NetworkManager.sharedInstance.request(endpointSearch, method: .get, parameters: ["api_key" : apiKey, "query" : self.query, "page" : self.page]).responseObject {[weak self] (response: DataResponse<MovieResponse>) in
            if let movieResponse = response.result.value {
                self?.completionHandler(movieResponse)
            }
        }
    }
}
