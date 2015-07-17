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
    @IBOutlet weak var containerView: UIView!
    
    var containerViewArea = Area()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setContainerViewArea()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        setContainerViewArea()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - Action
    
    
    // MARK: - Function
    
    func setContainerViewArea() {
        var defaults = NSUserDefaults.standardUserDefaults()
        
        containerViewArea.width = "\(DEFAULT_WIDTH)"
        containerViewArea.height = "\(DEFAULT_HEIGHT)"
        
        if let width = defaults.stringForKey("TotalWidth") {
            containerViewArea.width  = width
        }
        
        if let height = defaults.stringForKey("TotalHeight") {
            containerViewArea.height = height
        }
        
        widthHeightLabel.text = "\(containerViewArea.width) × \(containerViewArea.height)"
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
