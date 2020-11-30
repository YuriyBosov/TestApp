//
//  LoginViewController.swift
//  TestApp
//
//  Created by Yurii Bosov on 30.11.2020.
//

import UIKit

class LoginViewController: ViewController {
    
    var onRegistrationTapped: (()->())?
    var onRestorePassTapped: (()->())?
    
    var viewModel: LoginViewModel? {
        didSet {
            viewModel?.onLoadStart = { [weak self] in
                self?.view.showActivity()
            }
            viewModel?.onLoadEnd = { [weak self] error in
                if let message = error?.message {
                    self?.view.showError(text: message)
                } else {
                    self?.view.hideActivity()
                }
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: true)
    }
    
    //MARK: - Actions
    @IBAction private func loginButtonTapped() {
        hideKeyboard()
        viewModel?.login(email: "test", password: "test")
    }
    
    @IBAction private func registrationButtonTapped() {
        hideKeyboard()
        onRegistrationTapped?()
    }
    
    @IBAction private func restorePassButtonTapped() {
        hideKeyboard()
        onRestorePassTapped?()
    }
}
