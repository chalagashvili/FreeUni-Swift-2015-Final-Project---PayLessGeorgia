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
    
    func newAlertMessage(title: String!, message: String!) -> UIAlertController {
        let alert = UIAlertController(title: title, message: message,
            preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "OK", style: .Default, handler: { (action: UIAlertAction) in
            
        }))
        
        return alert
    }
    
    @IBAction func buttonPressed(sender: UIButton) {
        let newOne = Product(name: productName.text!, desc: productDesc.text!, img: productImage.image!, price: (productPrice.text! as NSString).floatValue)
    
        
        let added = newOne.addProductToList()
        
        var alert: UIAlertController
        if added == true {
            alert = newAlertMessage("New Product", message: "Product added successfully")
        } else {
            
            alert = newAlertMessage("New Product", message: "Oops... Something went wrong")
        }
        presentViewController(alert, animated: true, completion: nil)
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