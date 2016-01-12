//
//  Product.swift
//  PayLessGeorgia
//
//  Created by Vato Tabatadze on 1/12/16.
//  Copyright © 2016 Vato Tabatadze. All rights reserved.
//

import Foundation
import UIKit

var productList :[Product] = []

let currencyMap = [
    "USD" : 1.0,
    "RUR" : 76.09,
    "GEL" : 2.42
]

let currencyCountries = [
    "RU" : "RUR",
    "ENG" : "USD",
    "GEO" : "GEL"
]

var prefferedCurrency: String?

public class Product {
    
    public var name:String = ""
    public var desc:String = ""
    public var img:UIImage
    public var price:Float = 0
    
    init(name: String, desc:String, img:UIImage, price:Float) {
        self.name = name
        self.desc = desc
        self.img = img
        self.price = price
    }
    
    public func addProductToList() -> Bool {
        productList.append(self)
        return true
    }
    
}