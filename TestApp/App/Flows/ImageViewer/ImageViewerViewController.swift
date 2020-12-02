//
//  ImageViewerViewController.swift
//  TestApp
//
//  Created by Yurii Bosov on 01.12.2020.
//

import UIKit

class ImageViewerViewController: ViewController {
    
    var onDoneButtonClicked: (()->())?
    var onShareButtonClicked: ((UIImage, UIBarButtonItem?)->())?
    
    var viewModel: ImageViewerViewModel? {
        didSet {
            viewModel?.onLoadStart = { [weak self] in
                self?.shareButton?.isEnabled = false
                self?.view.showActivity()
            }
            viewModel?.onLoadEnd = { [weak self] error in
                if let error = error {
                    self?.view.showError(text: error.message)
                } else {
                    self?.view.hideActivity()
                }
            }
            viewModel?.onFetchCompletion = { [weak self]  image in
                self?.image = image as? UIImage
            }
        }
    }
    private var image: UIImage? {
        didSet {
            imageView.image = image
            shareButton?.isEnabled = (image != nil)
        }
    }
    private let imageView = UIImageView()
    private var doneButton: UIBarButtonItem?
    private var shareButton: UIBarButtonItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .darkGray
        self.navigationController?.navigationBar.tintColor = .white
        self.navigationController?.navigationBar.barTintColor = .darkGray
        
        self.view.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: view.topAnchor),
            imageView.leftAnchor.constraint(equalTo: view.leftAnchor),
            imageView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            imageView.rightAnchor.constraint(equalTo: view.rightAnchor)
        ])
        
        doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneButtonTapped))
        shareButton = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareButtonTapped))
        
        self.navigationItem.leftBarButtonItem = doneButton
        self.navigationItem.rightBarButtonItem = shareButton
        
        viewModel?.fetchData()
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    @objc private func doneButtonTapped() {
        onDoneButtonClicked?()
    }
    
    @objc private func shareButtonTapped() {
        if let image = image {
            onShareButtonClicked?(image, shareButton)
        }
    }
}

