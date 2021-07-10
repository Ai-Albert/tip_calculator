//
//  SettingsViewController.swift
//  tip_calculator
//
//  Created by Albert Ai on 7/9/21.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet weak var tipOne: UITextField!
    @IBOutlet weak var tipTwo: UITextField!
    @IBOutlet weak var tipThree: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Loading previously saved tip percentages
        let defaults = UserDefaults.standard
        tipOne.text = defaults.string(forKey: "tip1")
        tipTwo.text = defaults.string(forKey: "tip2")
        tipThree.text = defaults.string(forKey: "tip3")
        
        // Setting keyboard types
        tipOne.keyboardType = UIKeyboardType.decimalPad
        tipTwo.keyboardType = UIKeyboardType.decimalPad
        tipThree.keyboardType = UIKeyboardType.decimalPad
        
        // Setting first tip box as default
        tipOne.becomeFirstResponder()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Saving tip data
        let defaults = UserDefaults.standard
        defaults.set(tipOne.text, forKey: "tip1")
        defaults.set(tipTwo.text, forKey: "tip2")
        defaults.set(tipThree.text, forKey: "tip3")
        defaults.synchronize()
    }
}
