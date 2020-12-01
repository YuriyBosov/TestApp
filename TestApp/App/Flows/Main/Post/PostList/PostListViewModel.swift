//
//  PostListViewModel.swift
//  TestApp
//
//  Created by Yurii Bosov on 30.11.2020.
//

import UIKit

class PostListViewModel: ViewModel, ViewModelPaginationAbstract, PostActions {
    
    var onSelectPost: ((Post) -> ())?
    var onSelectTnumbnail: ((Post, Image) -> ())?
    var onPlayVideo: ((Post, Video) -> ())?
    
    
    var items = [PostCellViewModel]()
    var periodType: Post.PeriodType = .day {
        didSet {
            items.removeAll()
            afterMarker = nil
            onFetchCompletion?(items)
            fetchData(force: true)
        }
    }
    
    private var afterMarker: String?
    
    override func fetchData(force: Bool) {
        if force {
            task?.cancel()
            task = nil
            afterMarker = nil
        }
        
        if task != nil {
            return
        }
        
        if items.count == 0 {
            self.onLoadStart?()
        }
        
        task = Network.topPost(afterMarker: afterMarker, periodType: periodType, limit: 10, success: { (data) in
            self.task = nil
            do {
                let response = try JSONDecoder().decode(PostResponse.self, from: data)
                if force {
                    self.items.removeAll()
                }
                self.afterMarker = response.after
                
                // Model -> CellViewModel
                let viewModels = response.posts.map { (post) -> PostCellViewModel in
                    let viewModel = PostCellViewModel(post: post)
                    viewModel.onSelectPost = { [weak self] selectedPost in
                        self?.onSelectPost?(selectedPost)
                    }
                    viewModel.onSelectTnumbnail = { [weak self] selectedPost, image in
                        self?.onSelectTnumbnail?(selectedPost, image)
                    }
                    viewModel.onPlayVideo = { [weak self] selectedPost, video in
                        self?.onPlayVideo?(selectedPost, video)
                    }
                    return viewModel
                }
                
                self.items.append(contentsOf: viewModels)
                self.onLoadEnd?(nil)
                self.onFetchCompletion?(self.items)
                
            } catch {
                self.onLoadEnd?(ErrorHandler(error))
            }
        }, failure: { (error) in
            self.task = nil
            if error.code == ErrorHandler.ErrorCode.canceled {
                self.onLoadEnd?(nil)
            } else {
                self.onLoadEnd?(error)
            }
        })
    }
    
    func canLoadMore() -> Bool {
        return afterMarker != nil
    }
    
    func loadMoreData() {
        fetchData()
    }
}

