//
//  PostCell.swift
//  TestApp
//
//  Created by Yurii Bosov on 01.12.2020.
//

import UIKit

class PostCell: UITableViewCell {

    var onPlayButtonTapped: (()->())?
    var onThumbnailTapped: (()->())?
     
    @IBOutlet var thumbnail: UIImageView?
    @IBOutlet var title: UILabel?
    @IBOutlet var autor: UILabel?
    @IBOutlet var date: UILabel?
    @IBOutlet var comments: UILabel?
    @IBOutlet var playButton: UIButton?
    
    @IBAction private func playButtonTapped() {
        onPlayButtonTapped?()
    }
    
    @IBAction private func thumbnailTapped() {
        onThumbnailTapped?()
    }
    
}
