//
//  ViewController.swift
//  tips
//
//  Created by Kritarth Upadhyay on 7/10/16.
//  Copyright (c) 2016 walmart. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var minTip = 1.00
    var defaultCurr = 0;
    var defaultPercentIndex = 0;
    var has = false;
    var currencies = ["$","₹","€"]
    
    @IBOutlet weak var tipControl: UISegmentedControl!
    @IBOutlet weak var billField: UITextField!
    @IBOutlet weak var tipLabel: UILabel!
    @IBOutlet weak var totalLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        tipLabel.text = currencies[defaultCurr]+"0.00"
        totalLabel.text = currencies[defaultCurr]+"0.00"
        tipControl.selectedSegmentIndex = defaultPercentIndex;
        print("old")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onEditingChanged(sender: AnyObject) {
        recalculate()
    }

    @IBAction func onTap(sender: AnyObject) {
        view.endEditing(true)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        if(has) {
            let defaults = NSUserDefaults.standardUserDefaults()
            defaultCurr = defaults.integerForKey("currency")
            minTip = defaults.doubleForKey("minTip")
            defaultPercentIndex = defaults.integerForKey("defaultTip")
            print(defaultCurr)
            tipLabel.text = currencies[defaultCurr]+"0.00"
            totalLabel.text = currencies[defaultCurr]+"0.00"
            tipControl.selectedSegmentIndex = defaultPercentIndex;
        }
        has = true
        recalculate()
    }
    
    private func recalculate() {
    var tipPercentages = [0.18,0.2,0.25]
    var tipPercent = tipPercentages[tipControl.selectedSegmentIndex]
    var billAmount = NSString(string: billField.text!).doubleValue
    var tip = billAmount*tipPercent;
    if(tip<minTip) {
        tip = minTip;
    }
    var total = billAmount+tip;
    tipLabel.text = String(format: currencies[defaultCurr]+"%.2f", tip);
    totalLabel.text = String(format: currencies[defaultCurr]+"%.2f", total)
    }

}

