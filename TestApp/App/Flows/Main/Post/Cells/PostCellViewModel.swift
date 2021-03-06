//
//  PostCellViewModel.swift
//  TestApp
//
//  Created by Yurii Bosov on 01.12.2020.
//

import UIKit

class PostCellViewModel: PostActions {
    
    let post: Post
    
    var onSelectPost: ((Post)->())?
    var onSelectTnumbnail: ((Post, Image)->())?
    var onPlayVideo: ((Post, Video)->())?
    
    private static let dateTimeFormatter: RelativeDateTimeFormatter = {
        let formatter = RelativeDateTimeFormatter()
        formatter.unitsStyle = .full
        return formatter
    }()
    
    init(post: Post) {
        self.post = post
    }
    
    func setupCell(_ cell: PostCell) {
        
        cell.title?.text = post.title
        cell.autor?.text = post.author
        cell.playButton?.isHidden = (post.video == nil)
        cell.onThumbnailTapped = {
            if let tnumbnail = self.post.preview?.first?.source {
                self.onSelectTnumbnail?(self.post, tnumbnail)
            }
        }
        cell.onPlayButtonTapped = {
            if let video = self.post.video {
                self.onPlayVideo?(self.post, video)
            }
        }
        
        setupThumbnail(for: cell.thumbnail)
        setupCommentCount(for: cell.comments)
        setupCreateDate(for: cell.date)
    }
    
    func didSelectPost() {
        onSelectPost?(post)
    }
    
    private func setupThumbnail(for imageView: UIImageView?) {
        let thumbnailUrl = post.preview?.first?.resolutions.last?.url ?? ""
        imageView?.image(thumbnailUrl,
                         thumbnail: UIImage(named: "placeholder"))
    }
    
    private func setupCommentCount(for label: UILabel?) {
        if post.numComments == 0 {
            label?.text = "No Comment"
        } else if post.numComments == 1 {
            label?.text = "1 Comment"
        } else if post.numComments < 1000 {
            label?.text = "\(post.numComments) Comments"
        } else {
            label?.text = String(format: "%0.1fk Comments", (Float(post.numComments)/1000.0))
        }
    }
    
    private func setupCreateDate(for label: UILabel?) {
        label?.text = PostCellViewModel.dateTimeFormatter.localizedString(for: post.created, relativeTo: Date())
    }
}
