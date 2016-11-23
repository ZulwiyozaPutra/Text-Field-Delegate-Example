//
//  randomizedColorTextFieldDelegate.swift
//  Text Field Delegate Example
//
//  Created by Zulwiyoza Putra on 11/22/16.
//  Copyright © 2016 Zulwiyoza Putra. All rights reserved.
//

import Foundation
import UIKit
import GameKit

class RandomizedColorTextFieldDelegate: NSObject, UITextFieldDelegate {
    
    let colors: [UIColor] = [UIColor.red, UIColor.orange, UIColor.yellow, UIColor.green, UIColor.blue, UIColor.purple, UIColor.brown]
    
    func randomColor() -> UIColor {
        let randomIndex = GKRandomSource.sharedRandom().nextInt(upperBound: colors.count - 1)
        return colors[randomIndex]
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        textField.textColor = self.randomColor()
        return true
    }
}
