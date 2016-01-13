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
    public var product: Product?
    
    override public func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        print(segue.identifier!)
        if segue.identifier! == "Show Image" {
                if let ivc = segue.destinationViewController as? ImageViewController {
                    ivc.img = product?.img
                }
        }
    }

    
    
    override public func viewDidLoad() {
        super.viewDidLoad()
        self.detailDescription.text = product!.desc
        self.detailPriceChangeble.text = "" + "\(round(Double((product?.price)!) * Double(currencyMap[prefferedCurrency!]!) * 100) / 100.0) \(prefferedCurrency!)"
        self.detailProductName.text = product?.name
        self.detailProductImg.image = product?.img
        
        let tapGesture = UITapGestureRecognizer(target: self, action: "imageTapped:")
        detailProductImg.addGestureRecognizer(tapGesture)
        detailProductImg.userInteractionEnabled = true
    }
    
    func imageTapped(gesture: UIGestureRecognizer) {
        if let _ = gesture.view as? UIImageView {
            performSegueWithIdentifier("Show Image", sender: nil)
        }
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
    
    @IBOutlet weak var detailDescription: UITextView!
    
    @IBOutlet weak var detailProductName: UILabel!
    
    @IBOutlet weak var detailProductImg: UIImageView!
}