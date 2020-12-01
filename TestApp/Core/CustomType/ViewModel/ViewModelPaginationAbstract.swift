//
//  ViewModelPaginationAbstract.swift
//  TestApp
//
//  Created by Yurii Bosov on 01.12.2020.
//

import Foundation

protocol ViewModelPaginationAbstract: ViewModelAbstract {
    
    func canLoadMore() -> Bool
    func loadMoreData()
}
