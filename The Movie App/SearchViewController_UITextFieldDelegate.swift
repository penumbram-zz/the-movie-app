//
//  File.swift
//  The Movie App
//
//  Created by Tolga Caner on 11/06/2017.
//  Copyright © 2017 Tolga Caner. All rights reserved.
//

import UIKit

extension SearchViewController : UITextFieldDelegate{
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        actionSearch()
        return true
    }

    func textFieldDidBeginEditing(_ textField: UITextField) {
        self.target = HideKeyboardTarget(textField: textField)
        
        self.hideKeyboardGestureRecognizer = UITapGestureRecognizer(target: self.target, action: #selector(HideKeyboardTarget.handleTap(_:)))
        self.view.addGestureRecognizer(hideKeyboardGestureRecognizer!)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if self.hideKeyboardGestureRecognizer != nil {
            self.view.removeGestureRecognizer(self.hideKeyboardGestureRecognizer!)
        }
    }
    
}
