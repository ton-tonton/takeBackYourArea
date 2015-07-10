//
//  SettingTableViewController.swift
//  takeBackYourArea
//
//  Created by Tawatchai Sunarat on 7/2/15.
//  Copyright (c) 2015 ton. All rights reserved.
//

import UIKit

let DEFAULT_UNIT_INDEX = 0
let DEFAULT_WIDTH = 600.00
let DEFAULT_HEIGHT = 600.00

let TOTAL_AREA_SECTION = 0
let UNIT_SECTION = 1

class SettingTableViewController: UITableViewController {
    
    var units = []
    var selectedUnitIndex: Int = DEFAULT_UNIT_INDEX
    
    @IBOutlet weak var totalArea: UITableViewCell!
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
        
        if indexPath.section == UNIT_SECTION {
            
            if indexPath.row != selectedUnitIndex {
                let selectedUnitIndexPath = NSIndexPath(forRow: selectedUnitIndex, inSection: UNIT_SECTION)
                let selectedUnitCell = tableView.cellForRowAtIndexPath(selectedUnitIndexPath)
                selectedUnitCell?.accessoryType = .None
            }
            
            selectedUnitIndex = indexPath.row
            
            var defaults = NSUserDefaults.standardUserDefaults()
            defaults.setInteger(selectedUnitIndex, forKey: "Unit")
            
            let selectedUnitCell = tableView.cellForRowAtIndexPath(indexPath)
            selectedUnitCell?.accessoryType = .Checkmark
        }
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
