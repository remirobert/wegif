//
//  GalleryInteractor.swift
//  wegif
//
//  Created by Remi Robert on 09/05/16.
//  Copyright © 2016 Remi Robert. All rights reserved.
//

import UIKit

class GalleryInteractor: GalleryInteractorInput {

    var dataManager: GalleryDataManager?
    var interactorOutput: GalleryInteractorOutput?
    
    func fetchGalleryContent() {
        self.dataManager?.fetchTrendingGallery({ (gifs, error) in
            self.interactorOutput?.getGalleryContent(gifs, error: error)
        })
    }
}
