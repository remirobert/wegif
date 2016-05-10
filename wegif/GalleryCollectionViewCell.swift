//
//  GalleryCollectionViewCell.swift
//  wegif
//
//  Created by Remi Robert on 10/05/16.
//  Copyright © 2016 Remi Robert. All rights reserved.
//

import UIKit
import FLAnimatedImage
import PINRemoteImage

class GalleryCollectionViewCell: UICollectionViewCell, GalleryCellProtocol {

    @IBOutlet weak var imageView: FLAnimatedImageView!
    @IBOutlet weak var indicatorLoading: UIActivityIndicatorView!
    
    static var identifier: String {
        get {
            return "GalleryCollectionViewCell"
        }
    }
    
    static func initWithNib() -> UINib? {
        return UINib(nibName: "GalleryCollectionViewCell", bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func prepareForReuse() {
        self.imageView.animatedImage = nil
        self.indicatorLoading.startAnimating()
    }
    
    func configure(gif: Gif) {
        self.imageView.animatedImage = nil
        guard let imageUrl = gif.previewUrl,
            url = NSURL(string: imageUrl) else {
            return
        }
        self.imageView.pin_setImageFromURL(url)
    }
}
