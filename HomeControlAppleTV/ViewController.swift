//
//  ViewController.swift
//  HomeControlAppleTV
//
//  Created by Rafael M. A. da Silva on 7/4/16.
//  Copyright © 2016 venturus. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var temperatureLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("fetchTemperature"), userInfo: nil, repeats: true)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func switchLamp(sender: UISegmentedControl) {
        
        let light = sender.selectedSegmentIndex == 0 ? false : true
        IOTService.sharedInstance.switchLamp(light){(statuscode,error) -> () in
            //if let _ = error {
            //    self.lampSwitch.setOn(oldState, animated: true)
            //}
        }
    }
    
    func fetchTemperature() {
        print("fetch temp !!!")
        IOTService.sharedInstance.fetchTemperature(){(statuscode,error,homeModel) -> () in
            if let fetchedHomeModel = homeModel {
                print("fetch temperature \(fetchedHomeModel.temperatureValue)")
                self.temperatureLabel.text = String(format: "%.1f°", fetchedHomeModel.temperatureValue)
            }
        }
    }
    
    /*
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
    }*/

}

