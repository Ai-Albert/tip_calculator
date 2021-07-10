//
//  ViewController.swift
//  tip_calculator
//
//  Created by Albert Ai on 7/8/21.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var totalLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Sets the title in the navigation bar
        self.title = "Tip Calculator"
        
        // Sets up default tip percentages
        let defaults = UserDefaults.standard
        if defaults.integer(forKey: "tip1") == 0 {
            defaults.set("15", forKey: "tip1")
        }
        if defaults.integer(forKey: "tip2") == 0 {
            defaults.set("18", forKey: "tip2")
        }
        if defaults.integer(forKey: "tip3") == 0 {
            defaults.set("20", forKey: "tip3")
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        // Sets up the tip percentages text from UserDefaults
        let defaults = UserDefaults.standard
        tipControl.setTitle(
            "\(defaults.string(forKey: "tip1")!)%",
            forSegmentAt: 0
        )
        tipControl.setTitle(
            "\(defaults.string(forKey: "tip2")!)%",
            forSegmentAt: 1
        )
        tipControl.setTitle(
            "\(defaults.string(forKey: "tip3")!)%",
            forSegmentAt: 2
        )
        
        calculateTip(1)
    }
    
    @IBAction func calculateTip(_ sender: Any) {
        let defaults = UserDefaults.standard
        
        // Get bill amount from text field input
        let bill = Double(billAmountTextField.text!) ?? 0
        
        // Get total tip by multiplying tip * tipPercentage
        let tipPercentages = [
            defaults.double(forKey: "tip1") * 0.01,
            defaults.double(forKey: "tip2") * 0.01,
            defaults.double(forKey: "tip3") * 0.01,
        ]
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        
        // Update tip amount label
        tipAmountLabel.text = String(format: "$%.2f", tip)
        
        // Update total amount
        totalLabel.text = String(format: "$%.2f", total)
    }
    
    @IBAction func onBillChanged(_ sender: Any) {
        calculateTip(sender)
    }
}

