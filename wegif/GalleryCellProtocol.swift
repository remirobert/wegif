//
//  GalleryCellProtocol.swift
//  wegif
//
//  Created by Remi Robert on 10/05/16.
//  Copyright © 2016 Remi Robert. All rights reserved.
//

import UIKit

protocol GalleryCellProtocol {
    func configure(gif: Gif)
    static func initWithNib() -> UINib?
    static var identifier: String { get }
    var model: Gif? { get }
}
