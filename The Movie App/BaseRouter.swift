//
//  BaseRouter.swift
//  The Movie App
//
//  Created by Tolga Caner on 09/06/2017.
//  Copyright © 2017 Tolga Caner. All rights reserved.
//

import UIKit

protocol BaseWireframe : class {
    weak var viewController: UIViewController? { get set }
    static func assembleModule() -> UIViewController
}
