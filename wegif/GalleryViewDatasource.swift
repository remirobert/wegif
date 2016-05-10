//
//  GalleryViewDatasource.swift
//  wegif
//
//  Created by Remi Robert on 10/05/16.
//  Copyright © 2016 Remi Robert. All rights reserved.
//

import UIKit

class GalleryViewDatasource: NSObject, UICollectionViewDataSource {

    private var datas: [Gif]
    private var cellModel: GalleryCellProtocol.Type
    
    init(datas: [Gif], cellModel: GalleryCellProtocol.Type) {
        self.datas = datas
        self.cellModel = cellModel
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.datas.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(self.cellModel.identifier, forIndexPath: indexPath) as! GalleryCellProtocol
        
        cell.configure(self.datas[indexPath.row])
        return cell as! UICollectionViewCell
    }
}
