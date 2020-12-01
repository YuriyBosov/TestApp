//
//  PostListViewModel.swift
//  TestApp
//
//  Created by Yurii Bosov on 30.11.2020.
//

import UIKit

class PostListViewModel: ViewModel, ViewModelPaginationAbstract {
    
    var items = [Post]()
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
        
        task = Network.topPost(afterMarker: afterMarker, periodType: periodType, success: { (data) in
            self.task = nil
            do {
                let response = try JSONDecoder().decode(PostResponse.self, from: data)
                if force {
                    self.items.removeAll()
                }
                self.afterMarker = response.after
                self.items.append(contentsOf: response.posts)
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

