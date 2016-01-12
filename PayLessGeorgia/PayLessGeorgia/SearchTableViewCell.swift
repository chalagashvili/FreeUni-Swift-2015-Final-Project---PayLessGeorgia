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
    
    internal var product: Product? {
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
            productPriceLabel?.text = "Price: \(round(Double(product.price) * Double(currencyMap[prefferedCurrency!]!) * 100) / 100.0) \(prefferedCurrency!)"
            productImageView?.image = product.img
        }
    }
    
}