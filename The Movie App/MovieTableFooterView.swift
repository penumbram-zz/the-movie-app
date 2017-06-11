//
//  MovieTableFooterView.swift
//  The Movie App
//
//  Created by Tolga Caner on 11/06/2017.
//  Copyright © 2017 Tolga Caner. All rights reserved.
//

import UIKit

protocol MovieTableFooterDelegate: class {
    func didTapLoadMore()
}

class MovieTableFooterView : UITableViewHeaderFooterView {
    
     weak var delegate: MovieTableFooterDelegate?
    
    @IBAction func didTapLoadMore() {
        self.delegate?.didTapLoadMore()
    }
    
}
