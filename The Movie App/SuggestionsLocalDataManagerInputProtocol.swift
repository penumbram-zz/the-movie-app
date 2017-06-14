//
//  SuggestionsLocalDataManagerInputProtocol.swift
//  The Movie App
//
//  Created by Tolga Caner on 12/06/2017.
//  Copyright © 2017 Tolga Caner. All rights reserved.
//

import Foundation


protocol SuggestionsLocalDataManagerInputProtocol: class {
    
    static func retrieveSuggestions() throws -> [Search] // from interactor
    static func saveSuggestion(query: String) throws
}
