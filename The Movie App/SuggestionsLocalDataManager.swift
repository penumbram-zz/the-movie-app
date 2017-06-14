//
//  SuggestionsLocalDataManager.swift
//  The Movie App
//
//  Created by Tolga Caner on 12/06/2017.
//  Copyright © 2017 Tolga Caner. All rights reserved.
//

import Foundation
import CoreData

enum PersistenceError: Error {
    case ErrorNoContext
    case ErrorPersistingObject
}

let maxSuggestions = 10

class SuggestionsLocalDataManager: SuggestionsLocalDataManagerInputProtocol {

    
    static func retrieveSuggestions() throws -> [Search]  {
        
        guard let managedObjectContext = CoreDataStore.managedObjectContext else {
            throw PersistenceError.ErrorNoContext
        }
        
        let request: NSFetchRequest<Search> = NSFetchRequest(entityName: String(describing: Search.self))
        
        return try managedObjectContext.fetch(request)
    }
    
    static func saveSuggestion(query : String) throws {
        guard let managedObjectContext = CoreDataStore.managedObjectContext else {
            throw PersistenceError.ErrorNoContext
        }
        
        let suggestions = try retrieveSuggestions()
        
        let existing = suggestions.filter { $0.query == query }
        
        if !existing.isEmpty {
            managedObjectContext.delete(existing[0])
        } else if suggestions.count >= maxSuggestions {
            managedObjectContext.delete(suggestions[0])
        }
        
        if let newSearch = NSEntityDescription.entity(forEntityName: "Search",
                                                    in: managedObjectContext) {
            let search = Search(entity: newSearch, insertInto: managedObjectContext)
            search.query = query
            try managedObjectContext.save()
        }
        
        
        
        throw PersistenceError.ErrorPersistingObject
        
    }
    
}
