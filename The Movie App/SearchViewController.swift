//
//  SearchViewController.swift
//  The Movie App
//
//  Created by Tolga Caner on 09/06/2017.
//  Copyright © 2017 Tolga Caner. All rights reserved.
//

import UIKit

protocol SearchViewInterface: class {
    func actionSearch()
    func toggleSuggestions()
}

class SearchViewController: UIViewController, SearchViewInterface {
    
    let cellReuseIdentifier = "SearchViewControllerTableViewCellReuseIdentifier"
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var suggestionsTableView: UITableView!
    @IBOutlet weak var suggestionsTableViewHeight: NSLayoutConstraint!
    
    var target : HideKeyboardTarget?
    var hideKeyboardGestureRecognizer : UIGestureRecognizer?
    var presenter: SearchModuleInterface!
    var suggestions : [Search] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.suggestionsTableView.dataSource = self
        self.suggestionsTableView.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
}


extension SearchViewController {
    
    @IBAction func btnSearchAction() {
        self.target?.resignKeyboard()
        actionSearch()
    }
    
    func actionSearch() {
        self.presenter.searchQuery(textField.text!)
    }
    
}

extension SearchViewController {

    func toggleSuggestions() {
        do {
            self.suggestions = try SuggestionsLocalDataManager.retrieveSuggestions().reversed()
            self.suggestionsTableView.reloadData()
            self.suggestionsTableView.layoutIfNeeded()
            self.suggestionsTableView.setContentOffset(CGPoint.zero, animated: false)
            if self.suggestions.count > 0 {
                UIView.animate(withDuration: 0.20, animations: {
                    (self.suggestionsTableViewHeight.constant == 0) ? (self.suggestionsTableViewHeight.constant = 100.0) : (self.suggestionsTableViewHeight.constant = 0)
                    self.suggestionsTableView.layoutIfNeeded()
                })
            }
        } catch {
            print("Error retreiving suggestions")
        }
    }
    
}
