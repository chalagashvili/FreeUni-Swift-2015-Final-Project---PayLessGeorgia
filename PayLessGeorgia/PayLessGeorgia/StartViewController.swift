//
//  ViewController.swift
//  PayLessGeorgia
//
//  Created by Vato Tabatadze on 1/11/16.
//  Copyright © 2016 Vato Tabatadze. All rights reserved.
//

import UIKit
import Foundation

class StartViewController: UIViewController {
    
    let internetMsgConst = "Make sure your device is connected to the internet"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if Reachability.isConnectedToNetwork() == true {
            print ("Internet connection... OK")
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


}

