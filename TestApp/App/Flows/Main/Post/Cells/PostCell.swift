//
//  PostCell.swift
//  TestApp
//
//  Created by Yurii Bosov on 01.12.2020.
//

import UIKit

class PostCell: UITableViewCell {

    var post: Post? {
        didSet {
            
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
//        self.backgroundColor = Constant.Color.defaultBackgroundColor
    }
}
