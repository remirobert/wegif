//
//  ShareViewController.swift
//  wegif
//
//  Created by Remi Robert on 11/05/16.
//  Copyright © 2016 Remi Robert. All rights reserved.
//

import UIKit

class ShareViewController: UIViewController, ShareViewInterface {

    var eventHandler: ShareModuleInterface?
    
    @IBAction func closeShareController(sender: AnyObject) {
        self.eventHandler?.dismissController()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
