//
//  SearchViewController.swift
//  PayLessGeorgia
//
//  Created by Vato Tabatadze on 1/11/16.
//  Copyright © 2016 Vato Tabatadze. All rights reserved.
//

import Foundation
import UIKit

var needsRefresh = false

class SearchTableViewController: UITableViewController, UITextFieldDelegate {
    
    var toBeDisplayed: [Product] = productList
    
    var searchText: String? = "" {
        didSet {
            if searchText == "" {
                toBeDisplayed = productList
            } else {
                toBeDisplayed = []
                for product in productList {
                    if product.name.lowercaseString.containsString(searchText!.lowercaseString) || product.desc.lowercaseString.containsString(searchText!.lowercaseString) {
                        toBeDisplayed.append(product)
                    }
                }
            }
            self.refreshControl!.beginRefreshing()
            refresh(self.refreshControl!)
        }
        
    }
    
    @IBAction func refresh(sender: UIRefreshControl) {
        self.tableView.reloadData()
        sender.endRefreshing()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool) {
        refreshControl?.beginRefreshing()
        searchText = ""
        refresh(refreshControl!)
        needsRefresh = false
    }
    
    
    @IBOutlet weak var searchTextField: UITextField! {
        didSet {
            searchTextField.delegate = self
            searchTextField?.text = searchText
        }
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        searchText = searchTextField?.text
        return true
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toBeDisplayed.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier(Storyboard.CellReuseIdentifier, forIndexPath: indexPath) as! SearchTableViewCell
        
        cell.product = toBeDisplayed[indexPath.row]
        
        return cell
    }
    
    private struct Storyboard {
        static let CellReuseIdentifier = "Product"
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        print ("ki")
        if let id = segue.identifier {
            if id == "showProduct"{
                if let sectionsDest = segue.destinationViewController as? ProductDetailViewController {
                    if let twc = sender as? SearchTableViewCell {
                        sectionsDest.product = twc.product
                        print("oe")
                    }
                }
            }
        }
    }
    
    
}