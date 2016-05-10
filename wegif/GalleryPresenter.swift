//
//  GalleryPresenter.swift
//  wegif
//
//  Created by Remi Robert on 09/05/16.
//  Copyright © 2016 Remi Robert. All rights reserved.
//

import UIKit

class GalleryPresenter: GalleryModuleInterface, GalleryInteractorOutput {
    
    var interactor: GalleryInteractorInput?
    var wireframe: GalleryWireframe?
    var userInterface: GalleryViewInterface?
    
    func updateGalleryView() {
        self.interactor?.fetchGalleryContent()
    }
    
    func getGalleryContent(gifs: [Gif]?, error: NSError?) {
        print("gifs : \(gifs)")
        if let _ = error {
            self.userInterface?.showErrorMessage("Error Loading Gallery.")
        }
        else {
            guard let gifs = gifs else {
                return
            }
            self.userInterface?.showGallery(gifs)
        }
    }
}
