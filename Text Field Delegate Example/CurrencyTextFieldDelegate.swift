//
//  CurrencyTextFieldDelegate.swift
//  Text Field Delegate Example
//
//  Created by Zulwiyoza Putra on 11/22/16.
//  Copyright © 2016 Zulwiyoza Putra. All rights reserved.
//

import Foundation
import UIKit

class CurrencyTextFieldDelegate: NSObject, UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField.text!.isEmpty {
            textField.text = "$0.00"
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    func dollarsCurrencyStringFromInt(value: Int) -> String {
        return String(value/100)
    }
    
    func centsCurrencyStringFromInt(value: Int) -> String {
        let cents = value % 100
        var stringedCent = String(cents)
        if cents < 10 {
            stringedCent = "0" + stringedCent
        }
        return stringedCent
    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        let currentText = textField.text! as NSString
        var newText = currentText.replacingCharacters(in: range, with: string)
        var stringConvertedText = String(newText)
        
        let digits = CharacterSet.decimalDigits
        var digitText = ""
        for c in (stringConvertedText?.unicodeScalars)! {
            if digits.contains(UnicodeScalar(c.value)!) {
                digitText.append("\(c)")
            }
        }
        
        //The New String Formatting
        if let userValue = Int(digitText) {
            newText = "$" + self.dollarsCurrencyStringFromInt(value: userValue) + self.centsCurrencyStringFromInt(value: userValue)
        } else {
            newText = "$0.00"
        }
        
        textField.text = newText
        
        return false
    }
    
}
