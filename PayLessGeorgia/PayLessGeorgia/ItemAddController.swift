//
//  ItemAddController.swift
//  PayLessGeorgia
//
//  Created by Vato Tabatadze on 1/12/16.
//  Copyright © 2016 Vato Tabatadze. All rights reserved.
//

import Foundation
import UIKit

class ItemAddController: UIViewController {
 
    
    @IBOutlet weak var productName: UITextField!
    @IBOutlet weak var productDesc: UITextView!
    @IBOutlet weak var productPrice: UITextField!
    @IBOutlet weak var productImage: UIImageView!
    
    
    @IBAction func buttonPressed(sender: UIButton) {
        let newOne = Product(name: productName.text!, desc: productDesc.text!, img: "", price: (productPrice.text! as NSString).floatValue)
    
        
        newOne.addProductToList()
    }
}