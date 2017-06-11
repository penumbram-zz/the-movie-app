//
//  RootRouter.swift
//  The Movie App
//
//  Created by Tolga Caner on 01/06/2017.
//  Copyright © 2017 Tolga Caner. All rights reserved.
//

import UIKit

class RootRouter: RootWireframe {
    
    func presentMoviesScreen(in window: UIWindow) {
        window.makeKeyAndVisible()
        window.rootViewController = SearchRouter.assembleModule()
    }
}
