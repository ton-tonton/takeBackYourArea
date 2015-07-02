//
//  HomeViewController.swift
//  takeBackYourArea
//
//  Created by Tawatchai Sunarat on 7/2/15.
//  Copyright (c) 2015 ton. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        NSLog("Bello")
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    // MARK: - Unwide Segue
    
    @IBAction func cancelToHomeViewController(segue: UIStoryboardSegue) {
        NSLog("cancel")
    }
    
    @IBAction func addItem(segue: UIStoryboardSegue) {
        NSLog("add")
    }
    
    @IBAction func doneSetting(segue: UIStoryboardSegue) {
        
    }

}
