//
//  SearchPresenter.swift
//  The Movie App
//
//  Created by Tolga Caner on 11/06/2017.
//  Copyright © 2017 Tolga Caner. All rights reserved.
//

import Foundation

protocol SearchModuleInterface : class {
    func searchQuery(_ query: String)
}

protocol SearchInteractorOutput: class {
    func searchQueried(query: String)
}

class SearchPresenter : SearchModuleInterface, SearchInteractorOutput {
    
    weak var view: SearchViewInterface!

    // Reference to the Interactor's interface.
    var interactor: SearchInteractorInput!
    
    // Reference to the Router
    var wireframe: SearchWireframe!
    
    internal func searchQuery(_ query: String) {
        interactor.searchQuery(query)
    }
    
    internal func searchQueried(query: String) {
        self.wireframe.presentMovies(forQuery: query)
    }
    
}
