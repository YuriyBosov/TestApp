//
//  Session.swift
//  TestApp
//
//  Created by Yurii Bosov on 28.11.2020.
//

import Foundation


class Session {
    
    private enum Keys {
        static let userLogin = "Session.Key.UserLogin"
    }
    
    static let current = Session()
    
    private var _isUserLogin: Bool = UserDefaults.standard.bool(forKey: Keys.userLogin)
    
    var isUserLogin: Bool {
        get {
            return _isUserLogin
        }
    }
    
    func loginUser() {
        _isUserLogin = true
        UserDefaults.standard.set(_isUserLogin, forKey: Keys.userLogin)
    }
    
    func logoutUser() {
        _isUserLogin = false
        UserDefaults.standard.set(_isUserLogin, forKey: Keys.userLogin)
    }
}
