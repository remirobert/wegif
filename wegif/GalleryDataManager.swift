//
//  GalleryDataManager.swift
//  wegif
//
//  Created by Remi Robert on 10/05/16.
//  Copyright © 2016 Remi Robert. All rights reserved.
//

import UIKit
import Alamofire

class GalleryDataManager: GalleryManagerProtocol {
    
    private lazy var network: Network! = Network<[Gif]>()
    
    func fetchTrendingGallery(completion: BlockCompletion) {
        let request = GalleryService.Trending
        
        self.network.send(request: request, parse: Gif.initGifs, blockSuccess: { gifs in
            completion(gifs: gifs, error: nil)
        }) { error in
            completion(gifs: nil, error: error)
        }
    }
}
