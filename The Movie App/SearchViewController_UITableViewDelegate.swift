//
//  SearchViewController_UITableViewDelegate.swift
//  The Movie App
//
//  Created by Tolga Caner on 12/06/2017.
//  Copyright © 2017 Tolga Caner. All rights reserved.
//

import UIKit

extension SearchViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let suggestion = self.suggestions[indexPath.row]
        self.textField.text = suggestion.query!
        self.btnSearchAction()
    }
}
