//
//  ImageLoader.swift
//  TestApp
//
//  Created by Yurii Bosov on 30.11.2020.
//

import UIKit

final class ImageLoader {
    
    static let shared = ImageLoader()
    
    private let cache = NSCache<NSString, UIImage>()
    
    private init() {
        
    }
    
    func downloadImage(urlString: String, completion: @escaping (UIImage?, Error?) -> Void) {
        let urlEncodingString = String(htmlEncodedString: urlString)
        if let image = cache.object(forKey: urlEncodingString as NSString) {
            completion(image, nil)
        } else if
            let url = URL(string: urlEncodingString) {
            URLSession.shared.dataTask(with: url) { (data, response, error) in
                DispatchQueue.main.async {
                    if let data = data, let image = UIImage(data: data) {
                        self.cache.setObject(image, forKey: urlString as NSString)
                        completion(image, nil)
                    } else {
                        completion(nil, error)
                    }
                }
            }.resume()
        }
    }
}
