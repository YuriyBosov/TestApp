//
//  RegistrationViewModel.swift
//  TestApp
//
//  Created by Yurii Bosov on 30.11.2020.
//

import UIKit

class RegistrationViewModel: ViewModel {
    
    var onRegistrationSuccess: (()->())?
    
    func registration() {
        onLoadStart?()
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.onLoadEnd?(nil)
            self.onRegistrationSuccess?()
        }
    }
}
