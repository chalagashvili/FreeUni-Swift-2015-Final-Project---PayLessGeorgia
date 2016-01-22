//
//  ImageViewController.swift
//  PayLessGeorgia
//
//  Created by Irakli Chlagashvili on 1/13/16.
//  Copyright © 2016 Vato Tabatadze. All rights reserved.
//

import Foundation
import UIKit

class ImageViewController: UIViewController, UIScrollViewDelegate
{
    var img: UIImage? {
        didSet {
            image = nil
            if view.window != nil {
                fetchImage()
            }
        }
    }
    
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    
    private func fetchImage() {
        if true {
            spinner?.startAnimating()
            let qos = Int(QOS_CLASS_USER_INITIATED.rawValue)
            dispatch_async(dispatch_get_global_queue(qos, 0)) {
                dispatch_async(dispatch_get_main_queue()) {
                    if true {
                        if true {
                            self.image = self.img
                        }
                    }
                }
            }
        }
    }
    
    @IBOutlet weak var scrollView: UIScrollView! {
        didSet {
            scrollView.contentSize  = imageView.frame.size
            scrollView.delegate = self
            scrollView.minimumZoomScale = 0.03
            scrollView.maximumZoomScale = 5.0
        }
    }
    
    func viewForZoomingInScrollView(scrollView: UIScrollView) -> UIView? {
        return imageView
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        scrollViewDidScrollOrZoom = true
    }
    
    func scrollViewDidZoom(scrollView: UIScrollView) {
        scrollViewDidScrollOrZoom = true
    }
    
    private var imageView = UIImageView()
    
    private var image: UIImage? {
        get { return imageView.image }
        set {
            imageView.image = newValue
            imageView.sizeToFit()
            scrollView?.contentSize  = imageView.frame.size
            spinner?.stopAnimating()
            scrollViewDidScrollOrZoom = false
            autoScale()
        }
    }
    
    private var scrollViewDidScrollOrZoom = false
    
    private func autoScale() {
        if scrollViewDidScrollOrZoom {
            return
        }
        if let sv = scrollView {
            if image != nil {
                sv.zoomScale = max(sv.bounds.size.height / image!.size.height,
                    sv.bounds.size.width / image!.size.width)
                sv.contentOffset = CGPoint(x: (imageView.frame.size.width - sv.frame.size.width) / 2,
                    y: (imageView.frame.size.height - sv.frame.size.height) / 2)
                scrollViewDidScrollOrZoom = false
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        scrollView.addSubview(imageView)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        if image == nil {
            fetchImage()
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        autoScale()
    }
    
}