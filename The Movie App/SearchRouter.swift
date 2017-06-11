//
//  SearchRouter.swift
//  The Movie App
//
//  Created by Tolga Caner on 09/06/2017.
//  Copyright © 2017 Tolga Caner. All rights reserved.
//

import Foundation

import UIKit

protocol SearchWireframe: BaseWireframe {
    
    func presentResults(forQuery query:String?)
    
}


class SearchRouter : SearchWireframe {
    
    weak var viewController: UIViewController?
    
    static func assembleModule() -> UIViewController {
        
        let viewController = UIViewController(nibName: "SearchViewController", bundle: Bundle.main)

        let router = SearchRouter()
        
        router.viewController = viewController
        return viewController
    }
    
    internal func presentResults(forQuery query: String?) {
        print("Will present results here")
    }
}
