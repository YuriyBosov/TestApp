//
//  String.swift
//  TestApp
//
//  Created by Yurii Bosov on 01.12.2020.
//

import Foundation

extension String {

    init(htmlEncodedString: String) {
        self.init()
        guard let encodedData = htmlEncodedString.data(using: .utf8) else {
            self = htmlEncodedString
            return
        }

        let attributedOptions: [NSAttributedString.DocumentReadingOptionKey : Any] = [
            .documentType: NSAttributedString.DocumentType.html,
            .characterEncoding: String.Encoding.utf8.rawValue
        ]

        do {
            let attributedString = try NSAttributedString(data: encodedData, options: attributedOptions, documentAttributes: nil)
            self = attributedString.string
        }
        catch {
            print("Error: \(error)")
            self = htmlEncodedString
        }
    }
}
