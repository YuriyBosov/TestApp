//
//  PostActions.swift
//  TestApp
//
//  Created by Yurii Bosov on 01.12.2020.
//

import Foundation

protocol PostActions {
    var onSelectPost: ((Post)->())? { get set }
    var onSelectTnumbnail: ((Post, Image)->())? { get set }
    var onPlayVideo: ((Post, Video)->())? { get set }
}
