//
//  ViewController.swift
//  Text Field Delegate Example
//
//  Created by Zulwiyoza Putra on 11/22/16.
//  Copyright © 2016 Zulwiyoza Putra. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    
    let zipCodeTextFieldDelegate = ZipCodeTextFieldDelegate()
    
    let currencyTextFieldDelegate = CurrencyTextFieldDelegate()
    
    let randomizedColorTextFieldDelegate = RandomizedColorTextFieldDelegate()
    
    @IBOutlet weak var zipCodeTextField: UITextField!
    
    @IBOutlet weak var currencyTextField: UITextField!

    @IBOutlet weak var lockableTextField: UITextField!
    
    @IBOutlet weak var lockableSwitch: UISwitch!
    
    @IBAction func lockableSwitch(_ sender: Any) {
        
        if !(sender as! UISwitch).isOn {
            self.lockableTextField.resignFirstResponder()
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.zipCodeTextField.delegate = self.zipCodeTextFieldDelegate
        self.currencyTextField.delegate = self.currencyTextFieldDelegate
        self.lockableTextField.delegate = self.randomizedColorTextFieldDelegate
        self.lockableSwitch.setOn(false, animated: true)
        
    }
    
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        return self.lockableSwitch.isOn
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

