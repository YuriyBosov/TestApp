//
//  ErrorHandler.swift
//  TestApp
//
//  Created by Yurii Bosov on 30.11.2020.
//

import Foundation

class ErrorHandler  {
    
    enum Message: String {
        case `default` = "Извините, что то пошло нет так..."
        case sendRequest = "Не удалось отправить запрос на сервер."
        case receiveRequest = "Не удалось получить ответ от сервера."
        case serverConnection = "Нет соединения с сервером."
        case internetConnection = "Нет соединения с интернетом."
        case parse = "Не удается распарсить данные, полученные от сервера."
    }
    
    var message: String = ""
    var code: Int = 0
    
    init(_ message: String, _ code: Int = 0) {
        self.message = message
        self.code = code
    }
    
    init(_ message: ErrorHandler.Message, _ code: Int = 0) {
        self.message = message.rawValue
        self.code = code
    }
    
    init(_ error: Error) {
        self.message = error.localizedDescription
        self.code = (error as NSError).code
    }
}
