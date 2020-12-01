//
//  ImageViewerCoordinator.swift
//  TestApp
//
//  Created by Yurii Bosov on 01.12.2020.
//

import UIKit

class ImageViewerCoordinator: Coordinator {
    
    private let imageUrl: String
    
    init(router: Router, imageUrl: String) {
        self.imageUrl = imageUrl
        super.init(router: router)
    }
    
    override func start(with option: [String : AnyObject]? = nil) {
        let viewModel = ImageViewerViewModel(imageUrl: imageUrl)
        let controller = ImageViewerViewController()
        controller.viewModel = viewModel
        controller.onDoneButtonClicked = { [weak self] in
            self?.router.dismiss(animated: true, completion: {
                self?.onFinishFlow?(self)
            })
        }
        controller.onShareButtonClicked = { [weak self] image in
            self?.showImageShareController(image)
        }        
        self.router.setRootModule(controller)
    }
    
    private func showImageShareController(_ image: UIImage) {
        let controller = UIActivityViewController(activityItems: [image], applicationActivities: nil)
        self.router.present(controller, animated: true, completion: nil)
    }
}
