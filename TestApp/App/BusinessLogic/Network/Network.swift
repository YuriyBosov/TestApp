//
//  Network.swift
//  TestApp
//
//  Created by Yurii Bosov on 01.12.2020.
//

import Foundation

final class Network {
    
    private static let shared = Network()
    private let session: URLSession
    
    private init() {
        let configuration = URLSessionConfiguration.default
        session = URLSession(configuration: configuration)
    }
    
    // MARK: - Private Methods
    private static func handle(responseData: Data?,
                               responseError: Error?,
                               success: Constant.Block.data?,
                               failure: Constant.Block.error?) {
        if let data = responseData {
            #if DEBUG
//            if let json = try? JSONSerialization.jsonObject(with: data, options: []) {
                print("================================================")
                print("Response Success")
//                print("\(json)")
//            }
            #endif
            DispatchQueue.main.async {
                success?(data)
            }
        } else if let error = responseError {
            #if DEBUG
            print("================================================")
            print("Response Error:\n\(error)")
            #endif
            DispatchQueue.main.async {
                failure?(ErrorHandler(error))
            }
        } else {
            DispatchQueue.main.async {
                failure?(ErrorHandler(.default))
            }
        }
    }
    
    // MARK: - Public methods
    @discardableResult
    static func request(path: String,
                        method: Network.Method = .get,
                        parameters: [String: Any]? = nil,
                        success: Constant.Block.data? = nil,
                        failure: Constant.Block.error? = nil) -> URLSessionDataTask? {
        
        let headers = Network.Header.JSON

        var urlParams: String = ""
        var httpBody: Data? = nil
        
        if let parameters = parameters {
            if method == .get {
                urlParams = parameters.map{"\($0)=\($1)" }.joined(separator: "&")
            } else if method == .post  {
                httpBody = try? JSONSerialization.data(withJSONObject: parameters, options: [])
            }
        }
        
        var fullPath = urlParams.count > 0 ? ("\(path)?\(urlParams)") : path
        if let encodingFullPath = fullPath.addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed) {
            fullPath = encodingFullPath
        }
        guard let url = URL(string: Network.Setting.baseURL + "/" + fullPath) else {
            failure?(ErrorHandler(.sendRequest))
            #if DEBUG
            print("================================================")
            print("Response Error \(ErrorHandler.Message.sendRequest) \(fullPath)")
            #endif
            return nil
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        request.allHTTPHeaderFields = headers
        request.httpBody = httpBody
        
        #if DEBUG
        print("================================================")
        print("Method \(method.rawValue)\nUrl \(url.absoluteURL)")
        if method == .post, let parameters = parameters {
            print("Parameters\n\(parameters)")
        }
        #endif
        
        let task = Network.shared.session.dataTask(with: request) { (data, response, error) in
            Network.handle(responseData: data, responseError: error, success: success, failure: failure)
        }
        task.resume()
        return task
    }
    
}
