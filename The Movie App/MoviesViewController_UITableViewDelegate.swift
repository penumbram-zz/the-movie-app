//
//  MoviesViewController_UITableViewDelegate.swift
//  The Movie App
//
//  Created by Tolga Caner on 09/06/2017.
//  Copyright © 2017 Tolga Caner. All rights reserved.
//

import UIKit

extension MoviesViewController {
    
        
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
