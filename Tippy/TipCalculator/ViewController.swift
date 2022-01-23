//
//  ViewController.swift
//  TipCalculator
//
//  Created by min on 1/23/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billAmountTextField: UITextField!
    @IBOutlet weak var tipAmountLabel: UILabel!
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var partyControl: UIStepper!
    @IBOutlet weak var eachAmount: UILabel!
    @IBOutlet weak var partySize: UILabel!
    
    var total = 0.0;
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.title = "Tip Caculator"

    }

    @IBAction func calculateTip(_ sender: Any) {
        //Get bill amount from text field input
        let bill = Double(billAmountTextField.text!) ?? 0
        
        //Get totle tip by multiplying tip * tipPercentage
        let tipPercentages = [0.15, 0.18, 0.2]
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        total = bill + tip
        
        //Update Tip amount Label
        tipAmountLabel.text = String(format: "$%.2f", tip)
        //Update total amount
        totalLabel.text = String(format: "$%.2f", total)
        
    }
    
    @IBAction func stepperValueChange(_ sender: UIStepper) {
        
        let eachpaid = total / sender.value
        //Update each paid amount
        eachAmount.text = String(format: "$%.2f", eachpaid)
        //Upadte party size
        partySize.text = Int(sender.value).description

        
    }
    
    
}

