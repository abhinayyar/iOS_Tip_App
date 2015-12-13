//
//  SettingsViewController.swift
//  tip
//
//  Created by Abhishek Nayyar on 12/13/15.
//  Copyright (c) 2015 Abhishek Nayyar. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    
    
    @IBOutlet weak var P1Field: UITextField!
    
    @IBOutlet weak var P2Field: UITextField!
    
    @IBOutlet weak var P3Field: UITextField!

    @IBOutlet weak var MsgLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func saveData(sender: AnyObject) {
        
        let defaults = NSUserDefaults.standardUserDefaults()
        if P1Field.text.isEmpty == false
        {
            defaults.setObject(P1Field.text, forKey: "P1Perc")
        }
        if P2Field.text.isEmpty == false
        {
            defaults.setObject(P2Field.text, forKey: "P2Perc")
        }
        if P3Field.text.isEmpty == false
        {
            defaults.setObject(P3Field.text, forKey: "P3Perc")
        }
        defaults.synchronize()
        MsgLabel.text = "Saved Data Successfully"
        
        UILabel.animateWithDuration(4.4, animations: {self.MsgLabel.alpha = 0})
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
