//
//  StartViewModel.swift
//  TestApp
//
//  Created by Yurii Bosov on 30.11.2020.
//

import Foundation

class StartViewModel: ViewModel {
    
    override func fetchData() {
        onLoadStart?()
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.onLoadEnd?(nil)
            self.onFetchCompletion?(true)
        }
    }
}
