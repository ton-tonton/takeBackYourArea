//
//  SettingTableViewController.swift
//  takeBackYourArea
//
//  Created by Tawatchai Sunarat on 7/2/15.
//  Copyright (c) 2015 ton. All rights reserved.
//

import UIKit

let DEFAULT_UNIT_INDEX = 0

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
        
        var defaults = NSUserDefaults.standardUserDefaults()
        
        if defaults.objectForKey("Unit") != nil {
            selectedUnitIndex = defaults.integerForKey("Unit")
        }
        
        let unitCell = units[selectedUnitIndex] as! UITableViewCell
        unitCell.accessoryType = .Checkmark
        
        setTotalArea()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        setTotalArea()
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
    
    // MARK: - function
    
    func setTotalArea() {
        var defaults = NSUserDefaults.standardUserDefaults()
        
        if let width = defaults.stringForKey("TotalWidth") {
            totalArea.width = width
        }
        
        if let height = defaults.stringForKey("TotalHeight") {
            totalArea.height = height
        }
        
        totalAreaCell.textLabel?.text = "\(totalArea.width) × \(totalArea.height)"
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
