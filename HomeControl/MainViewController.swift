//
//  MainViewController.swift
//  HomeControl
//
//  Created by Rafael M. A. da Silva on 12/10/15.
//  Copyright © 2015 venturus. All rights reserved.
//

import UIKit

class MainViewController:UIViewController{
    
    @IBOutlet weak var lampSwitch: UISwitch!
    @IBOutlet weak var temperatureLabel: UILabel!
    @IBOutlet weak var temperatureImage: UIImageView!
    
    var homeInfoList:Array<HomeModel> = Array<HomeModel>()
    
    override func viewDidLoad() {
        let tapGestureRecognize = UITapGestureRecognizer(target: self, action: Selector("fetchTemperature"))
        temperatureImage.userInteractionEnabled = true
        temperatureImage.addGestureRecognizer(tapGestureRecognize)
        lampSwitch.addTarget(self, action: Selector("switchLamp"), forControlEvents: UIControlEvents.ValueChanged)
        NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("fetchLampState"), userInfo: nil, repeats: true)
    }
    
    func fetchTemperature() {
        print("fetch temp !!!")
        IOTService.sharedInstance.fetchTemperature(){(statuscode,error,homeModel) -> () in
            if let fetchedHomeModel = homeModel {
                print("fetch temperature \(fetchedHomeModel.temperatureValue)")
                self.temperatureLabel.text = String(format: "%.1f°", fetchedHomeModel.temperatureValue)
                self.homeInfoList.append(fetchedHomeModel)
            }
        }
    }
    
    func switchLamp() {
        let oldState = !lampSwitch.on
        IOTService.sharedInstance.switchLamp(lampSwitch.on){(statuscode,error) -> () in
            if let _ = error {
             self.lampSwitch.setOn(oldState, animated: true)
            }
        }
    }
    
    func fetchLampState() {
        IOTService.sharedInstance.fetchLampState(){(statuscode,error) ->  () in
            if error == nil {
                if statuscode == 200 {
                    self.lampSwitch.setOn(true, animated: true)
                }else{
                    self.lampSwitch.setOn(false, animated: true)
                }
            }
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        let historyTableViewController = segue.destinationViewController as? HistoryTableViewController
        historyTableViewController!.tableViewHomeInfoArray = homeInfoList
        
    }
    
}
