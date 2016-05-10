//
//  GalleryViewController.swift
//  wegif
//
//  Created by Remi Robert on 09/05/16.
//  Copyright © 2016 Remi Robert. All rights reserved.
//

import UIKit

class GalleryViewController: UIViewController, GalleryViewInterface {

    private var dataSource: GalleryViewDatasource?
    var eventHandler: GalleryModuleInterface?
    
    @IBOutlet var emptyView: UIView!
    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet weak var collectionViewLayout: UICollectionViewFlowLayout!
    
    private func configureCollectionView() {
        self.collectionView.registerNib(GalleryCollectionViewCell.initWithNib(),
                                        forCellWithReuseIdentifier: GalleryCollectionViewCell.identifier)
        self.collectionViewLayout.minimumInteritemSpacing = 0
        self.collectionViewLayout.minimumLineSpacing = 0
    }
    
    override func viewDidLayoutSubviews() {
        self.collectionViewLayout.itemSize = CGSizeMake(CGRectGetWidth(UIScreen.mainScreen().bounds) / 2,
                                                        CGRectGetWidth(UIScreen.mainScreen().bounds) / 2)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.orangeColor()
        self.configureCollectionView()
        self.eventHandler?.updateGalleryView()
        self.view = self.emptyView
    }
    
    func showErrorMessage(error: String) {
        print("show error : \(error)")
    }
    
    func showGallery(gifs: [Gif]) {
        self.view = self.collectionView
        self.dataSource = GalleryViewDatasource(datas: gifs, cellModel: GalleryCollectionViewCell.self)
        self.collectionView.dataSource = self.dataSource
        self.collectionView.reloadData()
    }
}

extension GalleryViewController: UICollectionViewDelegate {
    
}
