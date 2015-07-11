//
//  SettingTotalAreaViewController.swift
//  takeBackYourArea
//
//  Created by Tawatchai Sunarat on 7/10/15.
//  Copyright (c) 2015 ton. All rights reserved.
//

import UIKit

class SettingTotalAreaViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var widthTextField: UITextField!
    @IBOutlet weak var heightTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        widthTextField.delegate = self
        widthTextField.keyboardType = .NumbersAndPunctuation
        widthTextField.returnKeyType = .Done
        
        heightTextField.delegate = self
        heightTextField.keyboardType = .NumbersAndPunctuation
        heightTextField.returnKeyType = .Done
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: - TextFieldDelegate
    
    func textField(textField: UITextField, shouldChangeCharactersInRange range: NSRange, replacementString string: String) -> Bool {
        var isNumber = true
        let prospectiveText = (textField.text as NSString).stringByReplacingCharactersInRange(range, withString: string)
        
        if count(string) > 0 {
            let disallowedCharacterSet = NSCharacterSet(charactersInString: "0123456789.").invertedSet
            let replacementStringIsLegal = string.rangeOfCharacterFromSet(disallowedCharacterSet) == nil
            
            let scanner = NSScanner(string: prospectiveText)
            let resultingTextIsNumberic = scanner.scanDecimal(nil) && scanner.atEnd
            
            isNumber = replacementStringIsLegal && resultingTextIsNumberic
        }
        
        return isNumber
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
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
