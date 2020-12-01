//
//  PostDetailedViewModel.swift
//  TestApp
//
//  Created by Yurii Bosov on 30.11.2020.
//

import UIKit

class PostDetailedViewModel: ViewModel {
    
    let post: Post
    
    init(post: Post) {
        self.post = post
        super.init()
    }
}
