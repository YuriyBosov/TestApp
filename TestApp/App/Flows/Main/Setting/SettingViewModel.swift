//
//  SettingViewModel.swift
//  TestApp
//
//  Created by Yurii Bosov on 30.11.2020.
//

import UIKit

class SettingViewModel: ViewModel {
    
    var onLogout:(()->())?
    
    func logout() {
        onLogout?()
    }
    
}
