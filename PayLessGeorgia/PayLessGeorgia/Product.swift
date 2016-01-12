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
    public var price:Int = 0
    
    init(name: String, desc:String, img:String, price:Int) {
        self.name = name
        self.desc = desc
        self.img = img
        self.price = price
    }
    
}