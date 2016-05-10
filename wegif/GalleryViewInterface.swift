//
//  GalleryViewInterface.swift
//  wegif
//
//  Created by Remi Robert on 09/05/16.
//  Copyright © 2016 Remi Robert. All rights reserved.
//

import UIKit

protocol GalleryViewInterface {
    func showErrorMessage(error: String)
    func showGallery(gifs: [Gif])
}
