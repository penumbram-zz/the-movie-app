//
//  MoviesViewController_UITableViewDelegate.swift
//  The Movie App
//
//  Created by Tolga Caner on 09/06/2017.
//  Copyright © 2017 Tolga Caner. All rights reserved.
//

import UIKit
import SDWebImage

extension MoviesViewController {
    
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
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 1.0
    }
    
    override func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        if !self.shouldShowFooterView() {
            return nil
        }
        var headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: self.footerViewReuseIdentifier) as? MovieTableFooterView
        if (headerView == nil)
        {
            headerView = MovieTableFooterView(reuseIdentifier: self.footerViewReuseIdentifier)
        }
        headerView!.delegate = self
        return headerView
    }
    
    override func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        if !self.shouldShowFooterView() {
            return 1.0
        }
        return 50.0
    }
    
    func shouldShowFooterView() -> Bool {
        return self.totalPages != self.page && self.movies.count > 0
    }

}
