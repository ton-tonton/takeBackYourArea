//
//  SettingTableViewController.swift
//  takeBackYourArea
//
//  Created by Tawatchai Sunarat on 7/2/15.
//  Copyright (c) 2015 ton. All rights reserved.
//

import UIKit

let DEFAULT_UNIT_INDEX = 0
let DEFAULT_WIDTH = 600
let DEFAULT_HEIGHT = 600

let TOTAL_AREA_SECTION = 0
let UNIT_SECTION = 1

class SettingTableViewController: UITableViewController {
    
    var units = []
    var selectedUnitIndex: Int = DEFAULT_UNIT_INDEX
    var totalArea = Area()
    
    @IBOutlet weak var totalAreaCell: UITableViewCell!
    @IBOutlet weak var millimeterCell: UITableViewCell!
    @IBOutlet weak var inchCell: UITableViewCell!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        units = [millimeterCell, inchCell]
        
        totalArea.width = "\(DEFAULT_WIDTH)"
        totalArea.height = "\(DEFAULT_HEIGHT)"
        
        var defaults = NSUserDefaults.standardUserDefaults()
        
        if let width = defaults.stringForKey("TotalWidth") {
            totalArea.width = width
        }
        
        if let height = defaults.stringForKey("TotalHeight") {
            totalArea.height = height
        }
        
        if defaults.objectForKey("Unit") != nil {
            selectedUnitIndex = defaults.integerForKey("Unit")
        }
        
        totalAreaCell.textLabel?.text = "\(totalArea.width) × \(totalArea.height)"
        
        let unitCell = units[selectedUnitIndex] as! UITableViewCell
        unitCell.accessoryType = .Checkmark
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

    // MARK: - Navigation

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showSettingTotalArea" {
            let settingTotalAreaViewController = segue.destinationViewController as! SettingTotalAreaViewController
            settingTotalAreaViewController.width = totalArea.width
            settingTotalAreaViewController.height = totalArea.height
        }
    }

}
