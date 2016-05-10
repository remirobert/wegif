//
//  GalleryManagerProtocol.swift
//  wegif
//
//  Created by Remi Robert on 10/05/16.
//  Copyright © 2016 Remi Robert. All rights reserved.
//

import UIKit

typealias BlockCompletion = ((gifs: [Gif]?, error: NSError?) -> ())

protocol GalleryManagerProtocol {
    func fetchTrendingGallery(completion: BlockCompletion)
}
