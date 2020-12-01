//
//  PostCoordinator.swift
//  TestApp
//
//  Created by Yurii Bosov on 30.11.2020.
//

import UIKit
import AVKit

class PostCoordinator: BaseCoordinator {
    
    override func start(with option: [String : AnyObject]? = nil) {
        let viewModel = PostListViewModel()
        viewModel.onSelectPost = { [weak self] post in
            self?.showPostDetailedController(post)
        }
        viewModel.onSelectTnumbnail = { [weak self] post, image in
            self?.showPostTnumbnail(post, image: image)
        }
        viewModel.onPlayVideo = { [weak self] post, video in
            self?.playVideo(post, video: video)
        }
        
        let controller = PostListViewController.instantiateFromStoryboard(storyboardName: "Post")
        controller?.viewModel = viewModel
        
        self.router.setRootModule(controller)
    }
    
    private func showPostDetailedController(_ post: Post) {
        let viewModel = PostDetailedViewModel(post: post)
        let controller = PostDetailedViewController.instantiateFromStoryboard(storyboardName: "Post")
        controller?.viewModel = viewModel
        self.router.push(controller, animated: true)
    }
    
    private func showPostTnumbnail(_ post: Post, image: Image) {
        let coordinator = ImageViewerCoordinator(router: Router(rootController: UINavigationController()),
                                                 imageUrl: image.url)
        self.addDependency(coordinator)
        coordinator.onFinishFlow = { [weak self] coordinator in
            self?.removeDependency(coordinator)
        }
        coordinator.start()
        self.router.present(coordinator.router, animated: true, completion: nil)
    }
    
    private func playVideo(_ post: Post, video: Video) {
        guard let url = URL(string: video.fallbackUrl) else {
            return
        }
        let player = AVPlayer(url: url)
        let playerController = AVPlayerViewController()
        playerController.player = player
        self.router.present(playerController, animated: true) {
            player.play()
        }
    }
}
