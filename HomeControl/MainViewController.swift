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
    
    override func viewDidLoad() {
        lampSwitch.addTarget(self, action: Selector("switchLamp"), forControlEvents: UIControlEvents.ValueChanged)
    }
    
    func fetchTemperature() {
    
    }
    
    func switchLamp() {
        print("switchlamp changed state")
    }
    
    func fetchLampState() {
    
    
    }
    
}
