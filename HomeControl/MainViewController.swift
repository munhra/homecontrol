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
    
    override func viewDidLoad() {
        lampSwitch.addTarget(self, action: Selector("switchLamp"), forControlEvents: UIControlEvents.ValueChanged)
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: Selector("fetchTemperature"))
        temperatureImage.userInteractionEnabled = true
        temperatureImage.addGestureRecognizer(tapGestureRecognizer)
        NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: Selector("fetchLampState"), userInfo: nil, repeats: true)
    }
    
    func fetchTemperature() {
        print("fetchTemperature")
    }
    
    func switchLamp() {
        print("switchlamp changed state")
    }
    
    func fetchLampState() {
        print("get lamp state")
    }
    
}
