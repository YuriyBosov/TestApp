//
//  RegistrationViewController.swift
//  TestApp
//
//  Created by Yurii Bosov on 30.11.2020.
//

import UIKit

class RegistrationViewController: ViewController {
    
    var viewModel: RegistrationViewModel? {
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
    
    override func setup() {
        super.setup()
        self.title = "Registration"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    @IBAction private func registrationButtonTapped() {
        hideKeyboard()
        viewModel?.registration()
    }
}
