//
//  SearchTableViewCell.swift
//  PayLessGeorgia
//
//  Created by Vato Tabatadze on 1/12/16.
//  Copyright © 2016 Vato Tabatadze. All rights reserved.
//

import Foundation
import UIKit

class SearchTableViewCell: UITableViewCell {
    
    @IBOutlet weak var productImageView: UIImageView!
    @IBOutlet weak var productNameLabel: UILabel!
    @IBOutlet weak var productDescLabel: UILabel!
    @IBOutlet weak var productPriceLabel: UILabel!
    
    var product: Product? {
        didSet {
            updateUI();
        }
    }
    
    func updateUI() {
        
        productNameLabel?.text = nil
        productImageView?.image = nil
        productDescLabel?.text = nil
        productPriceLabel?.text = nil
        
        if let product = self.product {
            productNameLabel?.text = product.name
            productDescLabel?.text = product.desc
            productPriceLabel?.text = "Price: \(product.price) USD"
            
        }
    }
    
}