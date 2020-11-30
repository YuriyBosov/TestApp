//
//  AuthCoordinator.swift
//  TestApp
//
//  Created by Yurii Bosov on 30.11.2020.
//

import UIKit

class AuthCoordinator: BaseCoordinator {
    
    override func start(with option: [String : AnyObject]? = nil) {
        let viewModel = LoginViewModel()
        viewModel.onLoginSuccess = { [weak self] in
            self?.loginUserSuccess()
        }
        
        let controller = LoginViewController.instantiateFromStoryboard(storyboardName: "Auth")
        controller?.viewModel = viewModel
        controller?.onRegistrationTapped = { [weak self] in
            self?.showRegistrationController()
        }
        controller?.onRestorePassTapped = { [weak self] in
            self?.showRestorePassController()
        }
        
        self.router.setRootModule(controller)
    }
    
    private func loginUserSuccess() {
        self.session.loginUser()
        self.onFinishFlow?(self)
    }
    
    private func showRegistrationController() {
        let viewModel = RegistrationViewModel()
        viewModel.onRegistrationSuccess = { [weak self] in
            self?.showRegistrationSuccessDialog()
        }
        let controller = RegistrationViewController.instantiateFromStoryboard(storyboardName: "Auth")
        controller?.viewModel = viewModel
        self.router.push(controller, animated: true)
    }
    
    private func showRestorePassController() {
        let viewModel = RestorePassViewModel()
        viewModel.onRestorePasswordSuccess = { [weak self] in
            self?.showRestorePassSuccessDialog()
        }
        let controller = RestorePassViewController.instantiateFromStoryboard(storyboardName: "Auth")
        controller?.viewModel = viewModel
        self.router.push(controller, animated: true)
    }
    
    private func showRegistrationSuccessDialog() {
        let alert = UIAlertController(title: "Поздравляем!",
                                      message: "Вы успешно зарегистрировались в системе",
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ок", style: .default, handler: { (_) in
            self.loginUserSuccess()
        }))
        self.router.present(alert, animated: true, completion: nil)
    }
    
    private func showRestorePassSuccessDialog() {
        let alert = UIAlertController(title: "На указынный Email был отправлен новый пароль",
                                      message: nil,
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ок", style: .default, handler: { (_) in
            self.router.pop(animated: true)
        }))
        self.router.present(alert, animated: true, completion: nil)
    }
}
