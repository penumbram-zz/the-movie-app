//
//  File.swift
//  The Movie App
//
//  Created by Tolga Caner on 08/06/2017.
//  Copyright © 2017 Tolga Caner. All rights reserved.
//

import Foundation
import ObjectMapper

class MovieResponse: Mappable {
    var page: Int?
    var totalResults: Int?
    var totalPages: Int?
    var results: [Movie]?
    
    required init?(map: Map){
        
    }
    
    func mapping(map: Map) {
        page <- map["page"]
        totalResults <- map["total_results"]
        totalPages <- map["total_pages"]
        results <- map["results"]
    }
}
