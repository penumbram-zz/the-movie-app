//
//  ViewController.swift
//  The Movie App
//
//  Created by Tolga Caner on 31/05/2017.
//  Copyright © 2017 Tolga Caner. All rights reserved.
//

import UIKit

protocol MoviesViewInterface: class {
    func showMoviesData(_ movies: [Movie])
    func showNoContentScreen()
}

class MoviesViewController: UITableViewController, MoviesViewInterface {
    
    var presenter: MoviesModuleInterface!
    var movies : [Movie] = []
    let cellReuseIdentifier = "MoviesViewControllerTableViewCellReuseIdentifier"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter.updateView()
    }
    
    // MARK: MoviesViewInterface
    
    func showMoviesData(_ movies: [Movie]) {
        self.movies = movies
        self.tableView.reloadData()
    }
    
    func showNoContentScreen() {
        // TODO: Show custom empty screen.
    }

}

