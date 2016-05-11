//
//  ShareViewController.swift
//  wegif
//
//  Created by Remi Robert on 11/05/16.
//  Copyright © 2016 Remi Robert. All rights reserved.
//

import UIKit
import PINRemoteImage

class ShareViewController: UIViewController, ShareViewInterface {

    var eventHandler: ShareModuleInterface?
    @IBOutlet weak var imageView: FLAnimatedImageView!
    @IBOutlet weak var indicatorLoading: UIActivityIndicatorView!
    
    @IBAction func share(sender: AnyObject) {
        
    }
    
    @IBAction func closeShareController(sender: AnyObject) {
        self.imageView.pin_cancelImageDownload()
        self.eventHandler?.dismissController()
    }
    
    override func viewWillAppear(animated: Bool) {
        self.imageView.alpha = 0
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func displayPreviewGif(url: String) {
        guard let url = NSURL(string: url) else {
            return
        }
        self.imageView.pin_updateWithProgress = true
        self.imageView.pin_setImageFromURL(url) { (result: PINRemoteImageManagerResult) in
            print("result : \(result.error)")
            print("image:  \(result.image)")
            self.indicatorLoading.stopAnimating()
            UIView.animateWithDuration(0.9, animations: {
                self.imageView.alpha = 1
            })
        }
    }
}
