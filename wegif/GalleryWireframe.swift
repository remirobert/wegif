//
//  GalleryWireframe.swift
//  wegif
//
//  Created by Remi Robert on 10/05/16.
//  Copyright © 2016 Remi Robert. All rights reserved.
//

import UIKit

class GalleryWireframe {
    
    var galleryPresenter: GalleryPresenter?
    private var galleryViewController: GalleryViewController?
    
    func presentGalleryInterface(window: UIWindow) {
        self.galleryViewController = GalleryViewController.instanceController(.Main) as? GalleryViewController

        self.galleryViewController!.eventHandler = self.galleryPresenter
        self.galleryPresenter?.userInterface = self.galleryViewController
        let navigationController = window.rootViewController as! UINavigationController
        navigationController.viewControllers = [self.galleryViewController!]
    }
}
