//
//  LoginViewModel.swift
//  TestApp
//
//  Created by Yurii Bosov on 30.11.2020.
//

import UIKit

class LoginViewModel: ViewModel {
    
    var onLoginSuccess: (()->())?
    
    func login(email: String, password: String) {
        onLoadStart?()
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.onLoadEnd?(nil)
            self.onLoginSuccess?()
        }
    }
}
