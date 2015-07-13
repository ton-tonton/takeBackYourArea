//
//  SettingTotalAreaViewController.swift
//  takeBackYourArea
//
//  Created by Tawatchai Sunarat on 7/10/15.
//  Copyright (c) 2015 ton. All rights reserved.
//

import UIKit

class SettingTotalAreaViewController: UIViewController, UITextFieldDelegate {
    
    var width = String()
    var height = String()
    
    @IBOutlet weak var widthTextField: UITextField!
    @IBOutlet weak var heightTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        widthTextField.delegate = self
        widthTextField.keyboardType = .NumbersAndPunctuation
        widthTextField.returnKeyType = .Done
        widthTextField.text = "\(width)"
        
        heightTextField.delegate = self
        heightTextField.keyboardType = .NumbersAndPunctuation
        heightTextField.returnKeyType = .Done
        heightTextField.text = "\(height)"
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        
        var defaults = NSUserDefaults.standardUserDefaults()
        
        let width = widthTextField.text
        let height = heightTextField.text
        
        defaults.setObject(width, forKey: "TotalWidth")
        defaults.setObject(height, forKey: "TotalHeight")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
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
    
    // MARK: - Event
    
    override func touchesBegan(touches: Set<NSObject>, withEvent event: UIEvent) {
        self.view.endEditing(true)
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
