//
//  SettingsViewController.swift
//  tips
//
//  Created by Kritarth Upadhyay on 7/10/16.
//  Copyright (c) 2016 walmart. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    @IBOutlet weak var minTipField: UITextField!

    @IBOutlet weak var currencySegment: UISegmentedControl!
    @IBOutlet weak var defaultTipSegment: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        let defaults = NSUserDefaults.standardUserDefaults()
        currencySegment.selectedSegmentIndex = defaults.integerForKey("currency")
        defaultTipSegment.selectedSegmentIndex = defaults.integerForKey("defaultTip")
        minTipField.text = String(defaults.integerForKey("minTip"))
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func onDefaultTipChange(sender: AnyObject) {
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setInteger(defaultTipSegment.selectedSegmentIndex, forKey: "defaultTip")
        defaults.synchronize()
    }

    @IBAction func onDefaultCurrencyChange(sender: AnyObject) {
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setInteger(currencySegment.selectedSegmentIndex, forKey: "currency")
        print(currencySegment.selectedSegmentIndex)
        defaults.synchronize()
    }

    @IBAction func onMinTipChange(sender: AnyObject) {
        let defaults = NSUserDefaults.standardUserDefaults()
        defaults.setDouble(NSString(string: minTipField.text!).doubleValue, forKey: "minTip")
        defaults.synchronize()
    }
}
