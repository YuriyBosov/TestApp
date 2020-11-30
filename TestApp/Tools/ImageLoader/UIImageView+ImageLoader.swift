//
//  UIImageView+ImageLoader.swift
//  TestApp
//
//  Created by Yurii Bosov on 30.11.2020.
//

import UIKit

extension UIImageView {
    func image(_ urlString: String, thumbnail: UIImage? = nil, completion: ((UIImage?, Error?)->())? = nil) {
        self.image = thumbnail
        ImageLoader.shared.downloadImage(urlString: urlString) { (image, error) in
            self.image = image
            completion?(image, error)
        }
    }
}
