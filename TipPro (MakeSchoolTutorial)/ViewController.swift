//
//  ViewController.swift
//  TipPro (MakeAppTutorial)
//
//  Created by Alec Alameddine on 4/22/17.
//  Copyright © 2017 Alec Alameddine. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var billAmountField: UITextField!
    
    @IBOutlet weak var tipSelector: UISegmentedControl!
    
    @IBOutlet weak var tipPriceField: UITextField!
    
    @IBOutlet weak var billPriceField: UITextField!
    
    @IBAction func calculateTip(_ sender: AnyObject) {
        guard let billAmount = Double(billAmountField.text!) else {
            //show error
            billAmountField.text = ""
            tipPriceField.text = ""
            billPriceField.text = ""
            return
        }
        
        
        var tipPercentage = 0.0
        
        switch tipSelector.selectedSegmentIndex {
        case 0:
            tipPercentage = 0.15
        case 1:
            tipPercentage = 0.18
        case 2:
            tipPercentage = 0.20
        default:
            break
        }
        
        let roundedBillAmount = round(100*billAmount)/100
        let tipAmount = roundedBillAmount * tipPercentage
        let roundedTipAmount = round(100*tipAmount)/100
        let totalAmount = roundedBillAmount + roundedTipAmount
        
        if (!billAmountField.isEditing) {
            billAmountField.text = String(format: "%.2f", roundedBillAmount)
        }
        tipPriceField.text = String(format: "%.2f", roundedTipAmount)
        billPriceField.text = String(format: "%.2f", totalAmount)
  
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print("Hello World")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }

}

