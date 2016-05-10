//
//  GalleryService.swift
//  wegif
//
//  Created by Remi Robert on 10/05/16.
//  Copyright © 2016 Remi Robert. All rights reserved.
//

import UIKit

enum GalleryService: NetworkRequest {
    case Trending
}

extension GalleryService {
    
    func path() -> String {
        let publicKey = "?api_key=dc6zaTOxFJmzC"
        let baseUrl = "http://api.giphy.com/v1/gifs/"
        
        switch self {
        case .Trending:
            return "\(baseUrl)trending\(publicKey)"
        }
    }
    
    func method() -> NetworkMethod {
        return .GET
    }
}
