//
//  ViewController.swift
//  tip
//
//  Created by Abhishek Nayyar on 12/10/15.
//  Copyright (c) 2015 Abhishek Nayyar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    @IBOutlet weak var tipController: UISegmentedControl!
    
    @IBOutlet weak var tipLabel: UILabel!
    
    @IBOutlet weak var billField: UITextField!

    @IBOutlet weak var totalLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        tipLabel.text="$0.00"
        totalLabel.text="$0.00"
        
        
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        // call on first time view appear
        
    }

    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        // call on actual view change
        
        
        let defaults = NSUserDefaults.standardUserDefaults()
        
        if defaults.objectForKey("P1Perc") != nil {
            let P1Value = defaults.objectForKey("P1Perc") as! String
            tipController.setTitle(P1Value, forSegmentAtIndex: 0)
        }
        else
        {
            tipController.setTitle("18", forSegmentAtIndex: 0)
        }

        
        if defaults.objectForKey("P2Perc") != nil {
            let P2Value = defaults.objectForKey("P2Perc") as! String
            tipController.setTitle(P2Value, forSegmentAtIndex: 1)
        }
        else
        {
            tipController.setTitle("20", forSegmentAtIndex: 1)
        }

        
        if defaults.objectForKey("P3Perc") != nil {
            let P3Value = defaults.objectForKey("P3Perc") as! String
            tipController.setTitle(P3Value, forSegmentAtIndex: 2)
        }
        else
        {
            tipController.setTitle("25", forSegmentAtIndex: 2)
        }

    }

    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        // call on view change
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    


    @IBAction func onEditingChanged(sender: AnyObject) {
        
        let val1 = tipController.titleForSegmentAtIndex(0)!
        var val1amt = (val1 as NSString).doubleValue
    
        let val2 = tipController.titleForSegmentAtIndex(1)!
        var val2amt = (val2 as NSString).doubleValue
        
        let val3 = tipController.titleForSegmentAtIndex(2)!
        var val3amt = (val3 as NSString).doubleValue

        var tipAountP = [val1amt,val2amt,val3amt]
        
        
        var tipP = tipAountP[tipController.selectedSegmentIndex]/100
        
        var billAmountstr = billField.text
        
        var billAmount = (billAmountstr as NSString).doubleValue
        
        
        var tip = billAmount * tipP
        
        var total = billAmount + tip
        
        
        tipLabel.text = String(format: "$%.2f", tip)
        totalLabel.text = String(format: "$%.2f", total)
        
        
        
    }
    
    
    @IBAction func onTap(sender: AnyObject) {
        
        view.endEditing(true)
    }
    
}

