//
//  ShareViewController.swift
//  wegif
//
//  Created by Remi Robert on 11/05/16.
//  Copyright © 2016 Remi Robert. All rights reserved.
//

import UIKit
import PINRemoteImage

class ShareViewController: UIViewController {

    var eventHandler: ShareModuleInterface?
    @IBOutlet weak var imageView: FLAnimatedImageView!
    @IBOutlet weak var indicatorLoading: UIActivityIndicatorView!
    
    @IBAction func share(sender: AnyObject) {
        self.eventHandler?.shareMedia()
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
}

extension ShareViewController: ShareViewInterface {
    
    func displayPreviewGif(url: String) {
        guard let url = NSURL(string: url) else {
            return
        }
        dispatch_async(dispatch_get_main_queue()) {
            self.imageView.pin_updateWithProgress = true
            self.imageView.pin_setImageFromURL(url) { (result: PINRemoteImageManagerResult) in
                self.indicatorLoading.stopAnimating()
                UIView.animateWithDuration(0.9, animations: {
                    self.imageView.alpha = 1
                })
            }
        }
    }

    func displayFailedShare() {
        let alertController = UIAlertController(title: "⚠️ Video shared Failed", message: nil, preferredStyle: .Alert)
        alertController.addAction(UIAlertAction(title: "Ok", style: .Default, handler: { (_) in
            self.eventHandler?.dismissController()
        }))
        self.presentViewController(alertController, animated: true, completion: nil)
    }
    
    func displaySuccessShare() {
        let alertController = UIAlertController(title: "✅ Video shared success", message: nil, preferredStyle: .Alert)
        alertController.addAction(UIAlertAction(title: "Ok", style: .Default, handler: { (_) in
            self.eventHandler?.dismissController()
        }))
        self.presentViewController(alertController, animated: true, completion: nil)
    }
}
