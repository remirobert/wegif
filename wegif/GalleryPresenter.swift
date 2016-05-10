//
//  GalleryPresenter.swift
//  wegif
//
//  Created by Remi Robert on 09/05/16.
//  Copyright © 2016 Remi Robert. All rights reserved.
//

import UIKit

class GalleryPresenter: GalleryModuleInterface {

    var interactor: GalleryInteractor?
    var wireframe: GalleryWireframe?
    var userInterface: GalleryViewInterface?
    
    func loadGallery() {
        self.userInterface?.showGallery()
    }
}
