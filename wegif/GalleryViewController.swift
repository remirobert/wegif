//
//  GalleryViewController.swift
//  wegif
//
//  Created by Remi Robert on 09/05/16.
//  Copyright © 2016 Remi Robert. All rights reserved.
//

import UIKit

class GalleryViewController: UIViewController, GalleryViewInterface {

    var eventHandler: GalleryModuleInterface?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.orangeColor()
        
        self.eventHandler?.loadGallery()
    }
    
    func showErrorLoadinGallery(error: String?) {
        
    }
    
    func showGallery() {
        print("gallery shown")
    }
}
