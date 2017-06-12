//
//  MoviesViewController+UITableViewDataSource.swift
//  The Movie App
//
//  Created by Tolga Caner on 09/06/2017.
//  Copyright © 2017 Tolga Caner. All rights reserved.
//

import UIKit
import SDWebImage

extension MoviesViewController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = self.tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier) as? MoviesTableViewCell
        if (cell == nil)
        {
            cell = MoviesTableViewCell(style: .default, reuseIdentifier: cellReuseIdentifier)
        }
        
        cell?.selectedBackgroundView = UIView()
        let movie = self.movies[indexPath.row]
        cell!.lblTop.text = movie.title
        if movie.releaseDate != nil { //could be nil
            cell!.lblMiddle.text = movie.releaseDate!.stringValue()
        } else {
            cell!.lblMiddle.text = ""
        }
        
        cell!.lblBottom.text = movie.overview
        if movie.posterPath != nil {
            cell!.ivMain.sd_setImage(with: URL(string: "\(endpointImage)\(movie.posterPath!)"))
        } else {
            cell!.ivMain.image = nil
        }
        
        cell!.layoutIfNeeded()
        return cell!
    }


}
