//
//  SettingTableViewController.swift
//  takeBackYourArea
//
//  Created by Tawatchai Sunarat on 7/2/15.
//  Copyright (c) 2015 ton. All rights reserved.
//

import UIKit

let DEFAULT_UNIT_INDEX = 0

class SettingTableViewController: UITableViewController {
    
    var units = []
    var selectedUnitIndex: Int = DEFAULT_UNIT_INDEX
    
    @IBOutlet weak var millimeter: UITableViewCell!
    @IBOutlet weak var inch: UITableViewCell!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        units = [millimeter, inch]
        var defaults = NSUserDefaults.standardUserDefaults()
        
        if defaults.objectForKey("Unit") != nil {
            selectedUnitIndex = defaults.integerForKey("Unit")
        }

        let cell = units[selectedUnitIndex] as! UITableViewCell
        cell.accessoryType = .Checkmark
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - TableViewDelegate
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        if indexPath.row != self.selectedUnitIndex {
            let cell = tableView.cellForRowAtIndexPath(NSIndexPath(forRow: self.selectedUnitIndex, inSection: 0))
            cell?.accessoryType = .None
        }
        
        selectedUnitIndex = indexPath.row
        
        var defaults = NSUserDefaults.standardUserDefaults()
        defaults.setInteger(selectedUnitIndex, forKey: "Unit")
        
        let cell = tableView.cellForRowAtIndexPath(indexPath)
        cell?.accessoryType = .Checkmark
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
