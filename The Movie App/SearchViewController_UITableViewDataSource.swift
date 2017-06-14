//
//  SearchViewController_UITableViewDataSource.swift
//  The Movie App
//
//  Created by Tolga Caner on 12/06/2017.
//  Copyright © 2017 Tolga Caner. All rights reserved.
//

import UIKit

extension SearchViewController : UITableViewDataSource {
    
    @available(iOS 2.0, *)
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier)
        if (cell == nil)
        {
            cell = MoviesTableViewCell(style: .default, reuseIdentifier: cellReuseIdentifier)
        }
        cell?.textLabel?.text = suggestions[indexPath.row].query
        return cell!
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return suggestions.count
    }
}
