//
//  NetworkManager.swift
//  The Movie App
//
//  Created by Tolga Caner on 09/06/2017.
//  Copyright © 2017 Tolga Caner. All rights reserved.
//

// Url to the desired API.
let apiKey = "2696829a81b1b5827d515ff121700838"
let url = "http://api.themoviedb.org/3/search/movie"
let imageEndPoint = "http://image.tmdb.org/t/p/w185"

import Foundation
import Alamofire

class NetworkManager {
    
    static let sharedInstance = NetworkManager()
    
    var afManager : SessionManager!
    init() {
        let configuration = URLSessionConfiguration.default
        var headers : [AnyHashable : Any] = Alamofire.SessionManager.defaultHTTPHeaders
        headers.updateValue("application/json, application/x-www-form-urlencoded, */*", forKey: "Accept")
        headers.updateValue("application/json", forKey: "Content-Type")
        configuration.httpAdditionalHeaders = headers
        afManager = Alamofire.SessionManager(configuration: configuration)
    }
    
    open func request(
        _ url: URLConvertible,
        method: HTTPMethod = .get,
        parameters: Parameters? = nil,
        encoding: ParameterEncoding = URLEncoding.default,
        headers: HTTPHeaders? = nil)
        -> DataRequest
    {
        return afManager.request(url, method: method, parameters: parameters, encoding: encoding, headers: headers)
    }
    
    
}
