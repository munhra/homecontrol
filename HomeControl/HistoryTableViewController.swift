//
//  HistoryTableViewController.swift
//  HomeControl
//
//  Created by Rafael M. A. da Silva on 04/02/16.
//  Copyright © 2016 venturus. All rights reserved.
//

import Foundation
import UIKit

class HistoryTableViewController:UITableViewController {
    

    var tableViewHomeInfoArray = Array<HomeModel>()
    
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableViewHomeInfoArray.count
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("HomeInfoCell", forIndexPath: indexPath)
        cell.textLabel?.text = "\(tableViewHomeInfoArray[indexPath.row].temperatureValue)"
        cell.detailTextLabel?.text = "\(tableViewHomeInfoArray[indexPath.row].temperatureValue)"
        return cell
    }
    
    

}