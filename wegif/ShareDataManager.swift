//
//  ShareDataManager.swift
//  wegif
//
//  Created by Remi Robert on 11/05/16.
//  Copyright © 2016 Remi Robert. All rights reserved.
//

import UIKit

class ShareDataManager: ShareProtocol {

    override func shareVideoUrl(url: String) {
        let req = SendMessageToWXReq()
        req.bText = false
        req.scene = WXSceneTimeline.rawValue
        
        let videoObject = WXVideoObject()
        videoObject.videoUrl = url
        
        let message = WXMediaMessage()
        message.description = "Amazing Video shared with wegif"
        message.title = "Video"
        message.mediaObject = videoObject
        
        req.message = message
        
        WXApi.sendReq(req)
    }
}
