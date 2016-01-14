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
let serverURL = "http://192.168.1.5:80"

class SearchTableViewController: UITableViewController, UITextFieldDelegate {
    
    var toBeDisplayed: [Product] = productList
    
    func getJSON(urlToRequest: String) -> NSData{
        print(urlToRequest)
        let request =  NSURL(string: urlToRequest)!
        return NSData(contentsOfURL: request)!
    }
    
    func parseJSON(inputData: NSData) -> NSArray{
        do {
            let boardsDictionary = try NSJSONSerialization.JSONObjectWithData(inputData, options: NSJSONReadingOptions.MutableContainers) as! NSArray
            return boardsDictionary
        } catch _ {
            
        }
        return NSArray()
    }
    
    var searchText: String? = "" {
        didSet {
            if searchText == "" {
                searchText = "Most Visited"
            } else {
                toBeDisplayed = []
                
            }
            let escapeAddr = searchText!.stringByAddingPercentEncodingWithAllowedCharacters(NSCharacterSet.URLQueryAllowedCharacterSet())
            let data = getJSON("\(serverURL)?item=\(escapeAddr!)")
            let list = parseJSON(data)
            for item in list {
                let dict = item as! NSDictionary
                let name = dict["name"] as? String
                let desc = dict["description"] as? String
                let imageURL : String? = dict["imageURL"] as? String
                let priceTag = dict["price"]
                if let imageData = NSData(contentsOfURL: NSURL(string: imageURL!)!) {
                    let newImage = UIImage(data: imageData)!
                    let newItem : Product = Product(name: name!, desc: desc!, img: newImage, price: (priceTag!).floatValue)
                    toBeDisplayed.append(newItem)
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
    
    override func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        cell.backgroundColor = UIColor.clearColor()
    }
    
    override func viewWillAppear(animated: Bool) {
        refreshControl?.beginRefreshing()
        searchText = ""
        refresh(refreshControl!)
        needsRefresh = false
        self.tableView.backgroundColor = UIColor.lightGrayColor()
        UITabBar.appearance().barTintColor = UIColor.cyanColor()
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