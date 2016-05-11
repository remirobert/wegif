//
//  ShareInteractor.swift
//  wegif
//
//  Created by Remi Robert on 11/05/16.
//  Copyright © 2016 Remi Robert. All rights reserved.
//

import UIKit

class ShareInteractor: ShareInteractorInput {

    var interactorOutput: ShareInteractorOutput?
    var dataManager: ShareDataManagerProtocol?
    
    func shareMediaWechat(gif: Gif) {
        guard let url = gif.videoUrl else {
            self.interactorOutput?.shareGifFailed()
            return
        }
        if self.dataManager!.shareVideoUrl(url) {
            self.interactorOutput?.shareGifSuccess()
        }
        else {
            self.interactorOutput?.shareGifFailed()
        }
    }
}
