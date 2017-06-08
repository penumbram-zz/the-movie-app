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
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = self.tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier)
        if (cell == nil)
        {
            cell = UITableViewCell(style: .default, reuseIdentifier: cellReuseIdentifier)
        }
        cell?.selectedBackgroundView = UIView()
        cell?.textLabel?.text = self.movies[indexPath.row].title
        return cell!
    }

}

