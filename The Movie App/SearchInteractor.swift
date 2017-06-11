//
//  SearchInteractor.swift
//  The Movie App
//
//  Created by Tolga Caner on 11/06/2017.
//  Copyright © 2017 Tolga Caner. All rights reserved.
//

import Foundation

protocol SearchInteractorInput : class {
    var command : SearchCommand? {get}
    
    func searchQuery(_ query: String)
}


class SearchInteractor : SearchInteractorInput {
    internal var command: SearchCommand?
    
    // Reference to the Presenter's output interface.
    weak var output: SearchInteractorOutput!
    
    
    internal func searchQuery(_ query: String) {
        self.output.searchQueried(query: query)
    }
}
