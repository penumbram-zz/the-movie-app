//
//  HideKeyboardTarget.swift
//  The Movie App
//
//  Created by Tolga Caner on 11/06/2017.
//  Copyright © 2017 Tolga Caner. All rights reserved.
//

import UIKit

class HideKeyboardTarget : NSObject, UIGestureRecognizerDelegate {
    
    weak var textField : UITextField?
    weak var view : UIView?
    weak var tableView : UITableView?
    
    init(textField : UITextField, tableView : UITableView, view : UIView) {
        self.tableView = tableView
        self.view = view
        self.textField = textField
    }
    
    func handleTap(_ gestureRecognizer : UIGestureRecognizer)
    {
        self.resignKeyboard()
    }
    
    func resignKeyboard() {
        if self.textField != nil && self.textField!.canResignFirstResponder {
            self.textField!.resignFirstResponder()
        }
    }

    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
        // Block the recognition of tap gestures in the tableview.
        if touch.view!.isDescendant(of: self.tableView!) {
            return false
        }
        
        return true
    }
    
}
