//
//  HomeModel.swift
//  HomeControl
//
//  Created by Rafael M. A. da Silva on 12/10/15.
//  Copyright © 2015 venturus. All rights reserved.
//

import Foundation

class HomeModel {
    
    var temperatureValue:Float = 0;
    var time:String = "";
    var date:String = "";
    
    init(temperatureValue:Float, time:String, date:String){
        self.temperatureValue = temperatureValue;
        self.time = time;
        self.date = date;
    }
    
}
