//
//  SettingCoordinator.swift
//  TestApp
//
//  Created by Yurii Bosov on 30.11.2020.
//

import UIKit

class SettingCoordinator: BaseCoordinator {
    
    var onLogoutUser: (()->())?
    
    override func start(with option: [String : AnyObject]? = nil) {
        let viewModel = SettingViewModel()
        viewModel.onLogout = { [weak self] in
            self?.showLogoutDialog()
        }
        let controller = SettingViewController()
        controller.viewModel = viewModel
        self.router.setRootModule(controller)
    }
    
    private func showLogoutDialog() {
        let alert = UIAlertController(title: "Выйти из приложение?", message: nil, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Да", style: .destructive, handler: { [weak self] _ in
            self?.onLogoutUser?()
        }))
        alert.addAction(UIAlertAction(title: "Отмена", style: .cancel, handler: nil))
        self.router.present(alert, animated: true, completion: nil)
    }
}
