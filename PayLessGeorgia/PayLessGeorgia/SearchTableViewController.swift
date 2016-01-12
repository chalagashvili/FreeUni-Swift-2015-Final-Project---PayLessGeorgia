//
//  SearchViewController.swift
//  PayLessGeorgia
//
//  Created by Vato Tabatadze on 1/11/16.
//  Copyright © 2016 Vato Tabatadze. All rights reserved.
//

import Foundation
import UIKit

class SearchTableViewController: UITableViewController, UITextFieldDelegate {
    
    let imgs = []
    let names = ["Bread", "Toni's Bread", "Water", "Coca-cola", "Shawarma"]
    let descr = ["Stone Bread", "Gios Sacxobi's Bread", "Tap water",
                 "Chkonia & Co", "Gldanis Shaurma"]
    
    var searchText: String? = "" {
        didSet {
            print (searchText)
        }
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
        return 5
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCellWithIdentifier(Storyboard.CellReuseIdentifier, forIndexPath: indexPath) as! SearchTableViewCell
        
        cell.product = Product(name: names[indexPath.row], desc: descr[indexPath.row], img: "", price: 4)
        
        return cell
    }
    
    private struct Storyboard {
        static let CellReuseIdentifier = "Product"
    }
}
