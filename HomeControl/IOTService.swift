//
//  IOTService.swift
//  HomeControl
//
//  Created by Rafael M. A. da Silva on 12/10/15.
//  Copyright © 2015 venturus. All rights reserved.
//

import Foundation

// API
// Fetch temperature send GET to http://IOTCARD:XXXX/temperature receive as example {"value":34.10894050905481,"time":"11:30:90","date":"21/10/2014"}
// Switch lamp on/of send POST with JSON {"lampstate":false} on body to http://IOTCARD:XXXX/switchlamp, receive statuscode 200 if on and 201 if off
// Fetch lamp state send GET to http://IOTCARD:XXXX/switchlamp, receive statuscode 200 if on and 201 if off

class IOTService {
    
    //Singleton Pattern
    static let sharedInstance = IOTService()
    private init() {}
    
    func fetchTemperature(fetchedHomeTemperatureCallBack:(Int, NSError?, HomeModel?) -> ()){
        
    }
    
    func switchLamp(state:Bool,switchLampCallBack:(Int, NSError?) -> ()) {
        
    }
    
    func fetchLampState(switchLampCallBack:(Int, NSError?) -> ()) {
        
    }
    
    func convertJsonToHomeControl(jsonObjectData:NSData) -> HomeModel? {
        
        var homeControl:HomeModel?;
        
        do {
            
            let homeControlDictionary = try NSJSONSerialization.JSONObjectWithData(jsonObjectData, options: NSJSONReadingOptions.MutableContainers) as? NSDictionary
            let temperatureValue = homeControlDictionary?.objectForKey("value") as? Float
            let time = homeControlDictionary?.objectForKey("time") as? String
            let date = homeControlDictionary?.objectForKey("date") as? String
            
            if (temperatureValue != nil) && (time != nil) && (date != nil) {
                homeControl = HomeModel(temperatureValue: temperatureValue!, time: time!, date: date!);
            }
            
        } catch {
            print("Invalid JSON Object")
        }
        
        return homeControl
    }
    
}
