//
//  SharePresenter.swift
//  wegif
//
//  Created by Remi Robert on 11/05/16.
//  Copyright © 2016 Remi Robert. All rights reserved.
//

import UIKit

class SharePresenter: ShareModuleInterface, ShareInteractorOutput {

    var wireframe: ShareWireframe!
    var interactor: ShareInteractorInput?
    var userInterface: ShareViewInterface?
    
    var gif: Gif?
    
    func dismissController() {
        self.wireframe.dismissShareInterface()
    }
    
    func  startDisplay() {
        guard let url = gif?.originalUrl else {
            return
        }
        self.userInterface?.displayPreviewGif(url)
    }
    
    func shareMedia() {
        guard let gif = self.gif else {
            return
        }
        self.interactor?.shareMediaWechat(gif)
    }
    
    func shareGifSuccess() {
    }
    
    func shareGifFailed() {
    }
}
