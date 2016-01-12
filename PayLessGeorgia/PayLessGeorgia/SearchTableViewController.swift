//
//  SearchViewController.swift
//  PayLessGeorgia
//
//  Created by Vato Tabatadze on 1/11/16.
//  Copyright © 2016 Vato Tabatadze. All rights reserved.
//

import Foundation
import UIKit

var imgs = []
var names = ["Bread", "Toni's Bread", "Water", "Coca-cola", "Shawarma"]
var descr = ["Stone Bread", "Gios Sacxobi's Bread", "Tap water",
    "Chkonia & Co", "Gldanis Shaurma"]
var prices = [0.6, 0.6, 0.1, 0.9, 6.0]

class SearchTableViewController: UITableViewController, UITextFieldDelegate {
    
    var searchText: String? = "" {
        didSet {
            print (searchText)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Title"
        
        let navigationBar = navigationController!.navigationBar
        navigationBar.tintColor = UIColor.blueColor()
        
        let leftButton =  UIBarButtonItem(title: "Left Button", style: UIBarButtonItemStyle.Plain, target: self, action: nil)
        let rightButton = UIBarButtonItem(title: "Right Button", style: UIBarButtonItemStyle.Plain, target: self, action: nil)
        
        navigationItem.leftBarButtonItem = leftButton
        navigationItem.rightBarButtonItem = rightButton
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
        return names.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier(Storyboard.CellReuseIdentifier, forIndexPath: indexPath) as! SearchTableViewCell
        
        cell.product = Product(name: names[indexPath.row], desc: descr[indexPath.row], img: "", price: Float(prices[indexPath.row]))
        
        return cell
    }
    
    private struct Storyboard {
        static let CellReuseIdentifier = "Product"
    }
    
    static func addProductToList(product: Product) {
        
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
