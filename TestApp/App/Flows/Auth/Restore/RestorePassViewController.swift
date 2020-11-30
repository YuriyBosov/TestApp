//
//  RestorePassViewController.swift
//  TestApp
//
//  Created by Yurii Bosov on 30.11.2020.
//

import UIKit

class RestorePassViewController: ViewController {
    
    var viewModel: RestorePassViewModel? {
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
        self.title = "Restore Password"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(false, animated: true)
    }
    
    @IBAction private func registrationButtonTapped() {
        hideKeyboard()
        viewModel?.restorePassword()
    }
}
