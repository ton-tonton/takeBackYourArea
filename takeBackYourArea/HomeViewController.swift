//
//  HomeViewController.swift
//  takeBackYourArea
//
//  Created by Tawatchai Sunarat on 7/2/15.
//  Copyright (c) 2015 ton. All rights reserved.
//

import UIKit

let DEFAULT_WIDTH = 600
let DEFAULT_HEIGHT = 600

class HomeViewController: UIViewController {
    
    @IBOutlet weak var widthHeightLabel: UILabel!
    @IBOutlet weak var containerView: ContainerView!
    
    @IBOutlet weak var widthConstraint: NSLayoutConstraint!
    @IBOutlet weak var heightConstraint: NSLayoutConstraint!
    
    var containerViewArea = Area()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        setContainerViewArea()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Action
    
    @IBAction func addItem(sender: AnyObject) {
        var alert = UIAlertController(title: "Add Item", message: "Insert Width and Height", preferredStyle: .Alert)
        
        let insert = UIAlertAction(title: "OK", style: .Default) { (action: UIAlertAction!) in
            let widthTextFeild = alert.textFields![0] as! UITextField
            let heightTextFeild = alert.textFields![1] as! UITextField
        }
        
        let cancel = UIAlertAction(title: "Cancel", style: .Default) { (action: UIAlertAction!) in }
        
        alert.addTextFieldWithConfigurationHandler { (textField: UITextField!) in
            textField.placeholder = "Width"
        }
        
        alert.addTextFieldWithConfigurationHandler { (textField: UITextField!) in
            textField.placeholder = "Height"
        }
        
        alert.addAction(insert)
        alert.addAction(cancel)
        
        presentViewController(alert, animated: true, completion: nil)
    }
    
    // MARK: - Function
    
    func setContainerViewArea() {
        let screenWidth = Double(self.view.bounds.width)
        
        var defaults = NSUserDefaults.standardUserDefaults()
        
        containerViewArea.width = "\(DEFAULT_WIDTH)"
        containerViewArea.height = "\(DEFAULT_HEIGHT)"
        
        if let width = defaults.stringForKey("TotalWidth") {
            containerViewArea.width  = width
        }
        
        if let height = defaults.stringForKey("TotalHeight") {
            containerViewArea.height = height
        }
        
        var assumeWidth = containerViewArea.widthValue() * screenWidth / containerViewArea.maxLengthValue()
        var assumeHeight = containerViewArea.heightValue() * screenWidth / containerViewArea.maxLengthValue()
        
        widthHeightLabel.text = "\(containerViewArea.width) × \(containerViewArea.height)"
        widthConstraint.constant = CGFloat(assumeWidth)
        heightConstraint.constant = CGFloat(assumeHeight)
    }
    
    // MARK: - Navigation
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "modalSetting" {
            let navigationController = segue.destinationViewController as! UINavigationController
            let settingTableViewController = navigationController.topViewController as! SettingTableViewController
            settingTableViewController.totalArea = containerViewArea
        }
    }
    
    // MARK: - Unwide Segue
    
    @IBAction func doneSetting(segue: UIStoryboardSegue) {
        
    }

}
