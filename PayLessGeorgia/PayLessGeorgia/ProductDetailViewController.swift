//
//  ProductDetailViewController.swift
//  PayLessGeorgia
//
//  Created by Irakli Chlagashvili on 1/12/16.
//  Copyright © 2016 Vato Tabatadze. All rights reserved.
//

import Foundation
import UIKit
import SafariServices

public class ProductDetailViewController: UIViewController,SFSafariViewControllerDelegate{
    public var product: Product? {
        didSet {

        }
    }
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        print ("Loaded")
        self.detailDescription.text = product!.desc
        self.detailPriceChangeble.text = "" + (product?.price.description)!
        self.detailProductName.text = product?.name
        self.detailProductImg.image = UIImage(contentsOfFile: (product?.name)!)
    }
    
   
    @IBAction func googler(sender: UIButton) {
        let safariVC = SFSafariViewController(URL: NSURL(string: "http://google.com/search?ie=UTF-8&q="+(self.product?.name)!)!)
        self.presentViewController(safariVC, animated: true, completion: nil)
        safariVC.delegate = self
    }
    
    public func safariViewControllerDidFinish(controller: SFSafariViewController)
    {
        controller.dismissViewControllerAnimated(true, completion: nil)
    }
    
    @IBOutlet weak var detailPriceChangeble: UILabel!
    
    @IBOutlet weak var detailProductName: UILabel!
    
    @IBOutlet weak var detailDescription: UILabel!
    @IBOutlet weak var detailProductImg: UIImageView!
}