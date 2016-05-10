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
    private var refreshControl: UIRefreshControl!
    var eventHandler: GalleryModuleInterface?
    
    @IBOutlet var emptyView: UIView!
    @IBOutlet var errorView: UIView!
    @IBOutlet var collectionView: UICollectionView!
    @IBOutlet weak var collectionViewLayout: UICollectionViewFlowLayout!
    @IBOutlet weak var labelErrorMessage: UILabel!
    
    @IBAction func retryLoadgin(sender: AnyObject) {
        self.refreshContentGallery()
    }
    
    @objc func refreshContentGallery() {
        self.view = self.emptyView
        self.eventHandler?.updateGalleryView()
    }
    
    private func configureCollectionView() {
        self.collectionView.registerNib(GalleryCollectionViewCell.initWithNib(),
                                        forCellWithReuseIdentifier: GalleryCollectionViewCell.identifier)
        self.collectionViewLayout.minimumInteritemSpacing = 0
        self.collectionViewLayout.minimumLineSpacing = 0
        
        self.refreshControl = UIRefreshControl()
        self.refreshControl.addTarget(self, action: #selector(GalleryViewController.refreshContentGallery), forControlEvents: .ValueChanged)
        self.collectionView.addSubview(self.refreshControl)
        self.collectionView.alwaysBounceVertical = true
    }
    
    override func viewDidLayoutSubviews() {
        self.collectionViewLayout.itemSize = CGSizeMake(CGRectGetWidth(UIScreen.mainScreen().bounds) / 2,
                                                        CGRectGetWidth(UIScreen.mainScreen().bounds) / 2)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Gallery"
        self.view.backgroundColor = UIColor.orangeColor()
        self.configureCollectionView()
        self.eventHandler?.updateGalleryView()
        self.view = self.emptyView
    }
    
    func showErrorMessage(error: String) {
        self.view = self.errorView
        self.labelErrorMessage.text = error
    }
    
    func showGallery(gifs: [Gif]) {
        if self.refreshControl.refreshing {
            self.refreshControl.endRefreshing()
        }
        self.view = self.collectionView
        self.dataSource = GalleryViewDatasource(datas: gifs, cellModel: GalleryCollectionViewCell.self)
        self.collectionView.dataSource = self.dataSource
        self.collectionView.reloadData()
    }
}

extension GalleryViewController: UICollectionViewDelegate {
    
}
