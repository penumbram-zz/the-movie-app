//
//  SearchViewController.swift
//  The Movie App
//
//  Created by Tolga Caner on 09/06/2017.
//  Copyright © 2017 Tolga Caner. All rights reserved.
//

import UIKit

protocol SearchViewInterface: class {
    
}

class SearchViewController: UIViewController, SearchViewInterface {
    
    @IBOutlet weak var textField: UITextField!
    
    var target : HideKeyboardTarget?
    var hideKeyboardGestureRecognizer : UIGestureRecognizer?
    var presenter: SearchModuleInterface!
    
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
