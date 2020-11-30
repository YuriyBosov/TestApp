//
//  RestorePassViewModel.swift
//  TestApp
//
//  Created by Yurii Bosov on 30.11.2020.
//

import UIKit

class RestorePassViewModel: ViewModel {
    
    var onRestorePasswordSuccess: (()->())?
    
    func restorePassword() {
        onLoadStart?()
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.onLoadEnd?(nil)
            self.onRestorePasswordSuccess?()
        }
    }
}
