//
//  ViewController.swift
//  The Movie App
//
//  Created by Tolga Caner on 31/05/2017.
//  Copyright © 2017 Tolga Caner. All rights reserved.
//

import UIKit

protocol MoviesViewInterface: class {
    
    var query : String {get set}
    var page : Int {get set}
    var totalPages : Int {get set}
    
    func showMoviesData(_ movies: [Movie])
    func showNoContentScreen()
    func hideFooter()
}

class MoviesViewController: UITableViewController, MoviesViewInterface, MovieTableFooterDelegate {
    
    let cellReuseIdentifier = "MoviesViewControllerTableViewCellReuseIdentifier"
    let footerViewReuseIdentifier = "MovieTableFooterViewReuseIdentifier"
    
    var presenter: MoviesModuleInterface!
    var movies : [Movie] = []
    internal var query: String 
    internal var page: Int
    internal var totalPages: Int
    
    required init?(coder aDecoder: NSCoder) {
        self.query = ""
        self.page = 0
        self.totalPages = 0
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "\"\(self.query)\" results:"
        self.tableView.register(UINib(nibName: "MovieTableFooterView", bundle: nil), forHeaderFooterViewReuseIdentifier: self.footerViewReuseIdentifier)
        self.tableView.rowHeight = UITableViewAutomaticDimension;
        self.tableView.estimatedRowHeight = 150.0;
        fetchNewMoviesPage()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    // MARK: MoviesViewInterface
    
    func showMoviesData(_ movies: [Movie]) {
        self.movies.append(contentsOf: movies)
        self.tableView.reloadData()
    }
    
    func showNoContentScreen() {
        // TODO: Show custom empty screen.
    }
    
    internal func hideFooter() {
        self.tableView.tableFooterView = nil
    }
    
    // MARK: MovieTableFooterDelegate
    
    func didTapLoadMore() {
        fetchNewMoviesPage()
    }
    
    func fetchNewMoviesPage() {
        if page != 0 && page == totalPages {
            return
        }
        page += 1
        self.presenter.fetchMovies(query: query, page: page)
    }

}

