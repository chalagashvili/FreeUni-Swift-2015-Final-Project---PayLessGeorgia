//
//  Product.swift
//  PayLessGeorgia
//
//  Created by Vato Tabatadze on 1/12/16.
//  Copyright © 2016 Vato Tabatadze. All rights reserved.
//

import Foundation

public class Product {
    
    public var name:String = ""
    public var desc:String = ""
    public var img:String = ""
    public var price:Float = 0
    
    init(name: String, desc:String, img:String, price:Float) {
        self.name = name
        self.desc = desc
        self.img = img
        self.price = price
    }
    
    public func addProductToList() {
        names.append(self.name)
        descr.append(self.desc)
        prices.append(Double(self.price))
    }
    
}