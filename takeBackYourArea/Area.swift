//
//  Area.swift
//  takeBackYourArea
//
//  Created by Tawatchai Sunarat on 7/10/15.
//  Copyright (c) 2015 ton. All rights reserved.
//

import UIKit

class Area: NSObject {
    var width = String()
    var height = String()
    
    func widthValue() -> Double {
        return (width as NSString).doubleValue
    }
    
    func heightValue() -> Double {
        return (height as NSString).doubleValue
    }
    
    func maxLengthValue() -> Double {
        return max(self.widthValue(), self.heightValue())
    }
}
