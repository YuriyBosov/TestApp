//
//  Network+Post.swift
//  TestApp
//
//  Created by Yurii Bosov on 01.12.2020.
//

import Foundation

extension Network {
    
    static func topPost(afterMarker: String?,
                        periodType: Post.PeriodType = .day,
                        limit: Int = 25,
                        success: Constant.Block.data?,
                        failure: Constant.Block.error?) -> URLSessionDataTask? {

        var parameters: [String:Any] = ["limit":limit, "t": periodType.rawValue]
        if let afterMarker = afterMarker {
            parameters["after"] = afterMarker
        }
        let path = Network.Path.topPost
        
        return Network.request(path: path,
                               method: .get,
                               parameters: parameters,
                               success: success,
                               failure: failure)
    }
}
