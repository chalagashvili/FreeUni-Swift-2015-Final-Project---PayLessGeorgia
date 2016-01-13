//
//  SettingsViewController.swift
//  PayLessGeorgia
//
//  Created by Vato Tabatadze on 1/12/16.
//  Copyright © 2016 Vato Tabatadze. All rights reserved.
//

import Foundation
import UIKit

class SettingsTableViewController: UITableViewController {
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return currencyMap.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("currency", forIndexPath: indexPath) as UITableViewCell
        let key = currencyMap.startIndex.advancedBy(indexPath.row)
        cell.textLabel!.text = currencyMap.keys[key]
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let key = currencyMap.startIndex.advancedBy(indexPath.row)
        prefferedCurrency = currencyMap.keys[key]
        needsRefresh = true
        self.tabBarController?.selectedIndex = 0
    }
    
}