//
//  ViewController.swift
//  PayLessGeorgia
//
//  Created by Vato Tabatadze on 1/11/16.
//  Copyright © 2016 Vato Tabatadze. All rights reserved.
//

import UIKit
import Foundation

var imgs: [UIImage] = []
var imgUrls = [ "http://www.quinzanisbakery.com/images/bread-vienna.jpg",
                "http://img.gancxadebebi.ge/ka/gancxadebebi/Tonis-puri-GEO529174-1101776.jpg",
                "http://www.hoax-slayer.com/images/reusing-plastic-bottle.jpg",
                "http://www.bmstores.co.uk/images/hpcProductImage/imgFull/118303-Coca-Cola-500ml-Pet.jpg",
                "http://thumbs.dreamstime.com/z/kafta-shawarma-chicken-pita-wrap-roll-sandwich-traditional-arab-mid-east-food-32349304.jpg"
                ]
var names = ["Bread", "Toni's Bread", "Water", "Coca-cola", "Shawarma"]
var descr = ["Stone Bread", "Gios Sacxobi's Bread", "Tap water",
    "Chkonia & Co", "Gldanis Shaurma"]
var prices = [0.6, 0.6, 0.1, 0.9, 6.0]

class StartViewController: UIViewController {

    let internetMsgConst = "Make sure your device is connected to the internet"
    
    @IBAction func setCurrency(sender: UIButton) {
        prefferedCurrency = currencyCountries[sender.titleLabel!.text!]!
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prefferedCurrency = "USD"
        if Reachability.isConnectedToNetwork() == true {
            print ("Internet connection... OK")
            fillProductList()
        } else {
            print ("Internet connection... FAILED")
            let alert = UIAlertController(title: "Internet connection", message: internetMsgConst,
                preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "OK", style: .Default, handler: { (action: UIAlertAction) in
                print("OK pressed")
            }))
            presentViewController(alert, animated: true, completion: nil)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func fillImages() {
        for url in imgUrls {
            if let imageData = NSData(contentsOfURL: NSURL(string: url)!) { // blocks main thread!
                imgs.append(UIImage(data: imageData)!)
            }
        }
    }

    func fillProductList() {
        fillImages()
        for i in 0...4 {
            let product = Product(name: names[i], desc: descr[i], img: imgs[i], price: Float(prices[i]))
            productList.append(product)
        }
    }

}

