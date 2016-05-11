//
//  ShareWireframe.swift
//  wegif
//
//  Created by Remi Robert on 11/05/16.
//  Copyright © 2016 Remi Robert. All rights reserved.
//

import UIKit

class ShareWireframe {

    private var shareViewController: ShareViewController?
    var sharePresenter: SharePresenter?
    
    func presentShareInterface(parentController: UIViewController) {
        self.shareViewController = ShareViewController.instanceController(.Main) as? ShareViewController
        
        self.shareViewController?.eventHandler = self.sharePresenter
        self.sharePresenter?.userInterface = self.shareViewController

        self.shareViewController!.modalTransitionStyle = .CrossDissolve
        self.shareViewController!.modalPresentationStyle = .OverFullScreen
        parentController.presentViewController(self.shareViewController!, animated: true, completion: nil)
    }
    
    func dismissShareInterface() {
        self.shareViewController?.dismissViewControllerAnimated(true, completion: nil)
    }
}
