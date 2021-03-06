//
//  ViewModelAbstract.swift
//  TestApp
//
//  Created by Yurii Bosov on 30.11.2020.
//

import Foundation

protocol ViewModelAbstract {
    var onLoadStart: Constant.Block.loadStart? { get set }
    var onLoadEnd: Constant.Block.loadEnd? { get set }
    var onFetchCompletion: Constant.Block.loadCompletion? { get set }
    
    var task: URLSessionTask? { get set }
    
    func fetchData()
    func fetchData(force: Bool)
    func cancelFetchData()
}

extension ViewModelAbstract {
    
    func fetchData() {
        fetchData(force: false)
    }
    
    func cancelFetchData() {
        task?.cancel()
        onLoadEnd?(nil)
    }
    
}
