//
//  SecondViewController.swift
//  JasonShepherdToDoList
//
//  Created by Mac on 3/4/16.
//  Copyright © 2016 Salt Lake Community College. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController, UITextFieldDelegate {

    var importanceFlagBuffer = 0
    
    @IBOutlet weak var myLabel: UILabel!
    @IBOutlet weak var myTextField: UITextField!
   
    @IBOutlet weak var importanceLabel: UILabel!
    
    @IBAction func myButton(sender: AnyObject) {
        
        // Append value to importanceFlag array based on buffer
        if importanceFlagBuffer == 1 {
            importanceFlag.append(1)
        }
        if importanceFlagBuffer == 2 {
            importanceFlag.append(2)
        }
        if importanceFlagBuffer == 3 {
            importanceFlag.append(3)
        }
        
        // Append text to myTextField array
        toDoList.append(myTextField.text!)
        myTextField.text=""
        
        // Update keys
        NSUserDefaults.standardUserDefaults().setObject(toDoList, forKey: "toDoList")
        NSUserDefaults.standardUserDefaults().setObject(importanceFlag, forKey: "importanceFlags")
    
    }

 
    @IBAction func greenButton(sender: AnyObject) {
        importanceFlagBuffer = 1
        importanceLabel.text = "Not very."
    }
    
    @IBAction func yellowButton(sender: AnyObject) {
        importanceFlagBuffer = 2
        importanceLabel.text = "Kinda."
    }
    
    @IBAction func redButton(sender: AnyObject) {
        importanceFlagBuffer = 3
        importanceLabel.text = "Super duper."
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.myTextField.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // Closes the keyboard with tap outside
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    // Closes keyboard when return button pressed
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

}

