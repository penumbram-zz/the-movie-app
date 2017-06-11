//
//  HideKeyboardTarget.swift
//  The Movie App
//
//  Created by Tolga Caner on 11/06/2017.
//  Copyright © 2017 Tolga Caner. All rights reserved.
//

import UIKit

class HideKeyboardTarget : NSObject {
    
    weak var textField : UITextField?
    
    init(textField : UITextField) {
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
    
}
