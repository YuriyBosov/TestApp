//
//  ImageViewerViewModel.swift
//  TestApp
//
//  Created by Yurii Bosov on 01.12.2020.
//

import UIKit

class ImageViewerViewModel: ViewModel {
    
    let imageUrl: String
    
    init(imageUrl: String) {
        self.imageUrl = imageUrl
        super.init()
    }
    
    override func fetchData(force: Bool) {
        onLoadStart?()
        ImageLoader.shared.downloadImage(urlString: imageUrl) { [weak self] (image, error) in
            if let error = error {
                self?.onLoadEnd?(ErrorHandler(error))
            } else if let image = image {
                self?.onLoadEnd?(nil)
                self?.onFetchCompletion?(image)
            } else {
                self?.onLoadEnd?(ErrorHandler(.default))
            }
        }
    }
}
