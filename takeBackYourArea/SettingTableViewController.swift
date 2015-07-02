//
//  SettingTableViewController.swift
//  takeBackYourArea
//
//  Created by Tawatchai Sunarat on 7/2/15.
//  Copyright (c) 2015 ton. All rights reserved.
//

import UIKit

let UNITS = ["Millimeter", "Inch"]

class SettingTableViewController: UITableViewController {
    
    var selectedUnit: String = String()
    var selectedUnitIndex: Int = Int()
    
    @IBOutlet weak var millimeter: UITableViewCell!
    @IBOutlet weak var inch: UITableViewCell!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.millimeter.accessoryType = .Checkmark
        self.selectedUnit = UNITS[0]
        self.selectedUnitIndex = 0
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
        
        self.selectedUnitIndex = indexPath.row
        self.selectedUnit = UNITS[indexPath.row]
        
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
