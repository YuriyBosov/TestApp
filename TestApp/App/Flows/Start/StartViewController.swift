//
//  StartViewController.swift
//  TestApp
//
//  Created by Yurii Bosov on 30.11.2020.
//

import UIKit

class StartViewController: ViewController {
    
    var viewModel: StartViewModel? {
        didSet {
            viewModel?.onLoadStart = { [weak self] in
                self?.logoCenterYConstraint?.constant = -70
                self?.logoWidhtConstraint?.constant = 100
                UIView.animate(withDuration: 0.5) {
                    self?.view.layoutIfNeeded()
                }
                self?.view.showActivity("checking...")
            }
            viewModel?.onLoadEnd = { [weak self] error in
                self?.view.hideActivity()
            }
        }
    }
    
    @IBOutlet private var logoCenterYConstraint: NSLayoutConstraint?
    @IBOutlet private var logoWidhtConstraint: NSLayoutConstraint?
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        viewModel?.fetchData()
    }
    
    //MARK: - Private Methods
    
}
