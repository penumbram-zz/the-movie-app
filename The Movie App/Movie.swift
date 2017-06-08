//
//  Movie.swift
//  The Movie App
//
//  Created by Tolga Caner on 31/05/2017.
//  Copyright © 2017 Tolga Caner. All rights reserved.
//

import Foundation
import ObjectMapper

class Movie : Mappable {
    
    var voteCount: Int?
    var id: Int64?
    var video: Bool?
    var voteAverage: Float?
    var title : String?
    var populatiry : Float?
    var posterPath : String?
    var originalLanguage : String?
    var originalTitle : String?
    var genreIds : [Int]?
    var backdropPath : String?
    var adult : Bool?
    var overview : String?
    var releaseDate : Date?
    
    required init?(map: Map){
        
    }
    
    func mapping(map: Map) {
        voteCount <- map["vote_count"]
        id <- map["id"]
        video <- map["video"]
        voteAverage <- map["vote_average"]
        title <- map["title"]
        populatiry <- map["popularity"]
        posterPath <- map["poster_path"]
        originalLanguage <- map["original_language"]
        originalTitle <- map["original_title"]
        genreIds <- map["genre_ids"]
        backdropPath <- map["backdrop_path"]
        adult <- map["adult"]
        overview <- map["overview"]
        releaseDate <- (map["release_date"], TransformOf<Date, String>(fromJSON: {str in
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "yyyy-MM-dd" //Date format
            let date = dateFormatter.date(from: str!)
            return date
        }, toJSON: {date in
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd"
            return formatter.string(from: date!)
        }))
    }
}
