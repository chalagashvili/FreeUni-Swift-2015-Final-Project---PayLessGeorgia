//
//  ItemAddController.swift
//  PayLessGeorgia
//
//  Created by Vato Tabatadze on 1/12/16.
//  Copyright © 2016 Vato Tabatadze. All rights reserved.
//

import Foundation
import UIKit

class ItemAddController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
 
    
    @IBOutlet weak var productName: UITextField!
    @IBOutlet weak var productDesc: UITextView!
    @IBOutlet weak var productPrice: UITextField!
    @IBOutlet weak var productImage: UIImageView!
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var chooseButton: UIButton!
    
    var imagePicker = UIImagePickerController()
    
    override func viewWillAppear(animated: Bool) {
        
    }
    
    func newAlertMessage(title: String!, message: String!) -> UIAlertController {
        let alert = UIAlertController(title: title, message: message,
            preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "OK", style: .Default, handler: { (action: UIAlertAction) in
            
        }))
        
        return alert
    }
    
    @IBAction func buttonPressed(sender: UIButton) {
        let request = NSMutableURLRequest(URL: NSURL(string: serverURL)!)
        request.HTTPMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        let imageData = UIImageJPEGRepresentation(productImage.image!, 0.9)
        let base64String = imageData!.base64EncodedStringWithOptions(NSDataBase64EncodingOptions(rawValue: 0)) // encode the image
        
        let params = ["image":[ "content_type": "image/jpeg", "filename":"test.jpg", "file_data": base64String],
                      "name": productName.text!,
                      "desc": productDesc.text!,
                      "price": productPrice.text!]
        do {
            request.HTTPBody = try NSJSONSerialization.dataWithJSONObject(params, options: NSJSONWritingOptions(rawValue: 0))
        } catch _ {}
        
        let session = NSURLSession.sharedSession()
        let task = session.dataTaskWithRequest(request, completionHandler: { data, response, error -> Void in
            let strData = NSString(data: data!, encoding: NSUTF8StringEncoding)
            print(strData)
        })
        
        task.resume()
        
        self.tabBarController?.selectedIndex = 0
        
    }
    
    @IBAction func btnClicked(sender: AnyObject) {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.SavedPhotosAlbum){
            
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerControllerSourceType.SavedPhotosAlbum;
            imagePicker.allowsEditing = false
            
            self.presentViewController(imagePicker, animated: true, completion: nil)
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        productName.text = ""
        productDesc.text = ""
        productPrice.text = ""
        productImage.image = nil
        UITabBar.appearance().barTintColor = UIColor.cyanColor()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    func imagePickerController(picker: UIImagePickerController!, didFinishPickingImage image: UIImage!, editingInfo: NSDictionary!){
        self.dismissViewControllerAnimated(true, completion: { () -> Void in
            
        })
        
        imageView.image = image
        
    }

}
