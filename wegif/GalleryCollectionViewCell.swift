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
    
    var model: Gif?
    
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
        self.model = nil
        self.imageView.animatedImage = nil
        self.imageView.alpha = 0
        self.indicatorLoading.startAnimating()
    }
    
    func configure(gif: Gif) {
        self.model = gif
        self.imageView.animatedImage = nil
        guard let imageUrl = gif.previewUrl,
            url = NSURL(string: imageUrl) else {
            return
        }
        self.imageView.pin_setImageFromURL(url) { (result: PINRemoteImageManagerResult) in
            self.indicatorLoading.stopAnimating()
            UIView.animateWithDuration(0.8, animations: {
                self.imageView.alpha = 1
            })
        }
    }
}
