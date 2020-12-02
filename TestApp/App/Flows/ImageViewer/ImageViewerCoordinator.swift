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
        controller.onShareButtonClicked = { [weak self] image, button in
            self?.showImageShareController(image, shareButton: button)
        }
        let navigationController = NavigationController(rootViewController: controller)
        navigationController.modalPresentationStyle = .fullScreen
        self.router.present(navigationController, animated: true, completion: nil)
    }
    
    private func showImageShareController(_ image: UIImage, shareButton: UIBarButtonItem? = nil) {
        let controller = UIActivityViewController(activityItems: [image], applicationActivities: nil)
        if UIDevice.current.userInterfaceIdiom == .pad {
            controller.popoverPresentationController?.barButtonItem = shareButton
        }
        self.router.present(controller, animated: true, completion: nil)
    }
}
