//
//  ViewModel.swift
//  TestApp
//
//  Created by Yurii Bosov on 30.11.2020.
//

import Foundation

class ViewModel: NSObject, ViewModelAbstract {
    
    var task: URLSessionTask?
    
    deinit {
        #if DEBUG
        print("deinit \(self.className)")
        #endif
    }
    
    
    // used for update UI (show\hide activiti indicator, show responce error)
    var onLoadStart: Constant.Block.loadStart?
    var onLoadEnd: Constant.Block.loadEnd?
    
    // used for successful data received
    var onFetchCompletion: Constant.Block.loadCompletion?
    
    // start fetch data request    
    func fetchData(force: Bool) {
        
    }
}
