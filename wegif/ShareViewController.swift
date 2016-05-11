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
    
    @IBAction func closeShareController(sender: AnyObject) {
        self.eventHandler?.dismissController()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func displayPreviewGif(url: String) {
        guard let url = NSURL(string: url) else {
            return
        }
        self.imageView.pin_setImageFromURL(url)
    }
}
