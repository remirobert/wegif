//
//  AppDependencies.swift
//  wegif
//
//  Created by Remi Robert on 09/05/16.
//  Copyright © 2016 Remi Robert. All rights reserved.
//

import UIKit

class AppDependencies {
    
    private var window: UIWindow
    private let galleryWireframe = GalleryWireframe()
    private let shareWireframe = ShareWireframe()
    
    private func initShareDependencies() {
        let sharePresenter = SharePresenter()
        let shareInteractor = ShareInteractor()
        
        sharePresenter.interactor = shareInteractor
        sharePresenter.wireframe = self.shareWireframe
        
        shareInteractor.interactorOutput = sharePresenter
        self.shareWireframe.sharePresenter = sharePresenter
    }
    
    private func initGalleryDependencies() {
        let galleryPresenter = GalleryPresenter()
        let galleryInteractor = GalleryInteractor()
        let dataManager = GalleryDataManager()
        
        galleryPresenter.interactor = galleryInteractor
        galleryPresenter.wireframe = self.galleryWireframe
        
        galleryInteractor.dataManager = dataManager
        galleryInteractor.interactorOutput = galleryPresenter
        
        self.galleryWireframe.galleryPresenter = galleryPresenter
    }
    
    func presentRootController() {
        self.galleryWireframe.presentGalleryInterface(self.window)
    }
    
    init(window: UIWindow) {
        self.window = window
        self.initGalleryDependencies()
        self.initShareDependencies()
        
        self.galleryWireframe.shareWireframe = self.shareWireframe
    }
}
