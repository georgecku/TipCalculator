//
//  ViewController.swift
//  TipCalculator
//
//  Created by George Ku on 12/20/16.
//  Copyright © 2016 George Ku. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var splitField: UITextField!
    @IBOutlet weak var subtotalField: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        billField.becomeFirstResponder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let defaults = UserDefaults.standard
        tipControl.selectedSegmentIndex =
            defaults.integer(forKey: "tipInt")

        let tipPercentages = [0.18, 0.20, 0.25]
        
        let bill = Double(billField.text!) ?? 0
        
        var split = Int(splitField.text!)
        if split != nil {
            if split! <= 0 {
                split = 1;
                splitField.text = "1"
            }
        }
        else {
            split = 1;
            splitField.text = "1"
        }
        
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        let subtotal = total/Double(split!)
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        subtotalField.text = String(format: "$%.2f", subtotal)
    }

    @IBAction func onTap(_ sender: Any) {
        view.endEditing(true)
    }
    
    @IBAction func calculateTip(_ sender: AnyObject) {
        
        let tipPercentages = [0.18, 0.20, 0.25]
        
        let bill = Double(billField.text!) ?? 0
        
        var split = Int(splitField.text!)
        if split != nil {
            if split! <= 0 {
                split = 1;
                splitField.text = "1"
            }
        }
        else {
            split = 1;
            splitField.text = "1"
        }
        
        let tip = bill * tipPercentages[tipControl.selectedSegmentIndex]
        let total = bill + tip
        let subtotal = total/Double(split!)
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        subtotalField.text = String(format: "$%.2f", subtotal)
        
    }
}

