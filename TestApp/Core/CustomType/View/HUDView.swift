//
//  HUDView.swift
//  TestApp
//
//  Created by Yurii Bosov on 30.11.2020.
//

import UIKit

class HUDView: UIView {
    
    private var activityIndicator = UIActivityIndicatorView(style: .whiteLarge)
    private var textLabel = UILabel()
    
    private static let tag = 1111
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.tag = HUDView.tag
        
        activityIndicator.color = .gray
        activityIndicator.hidesWhenStopped = true
        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(activityIndicator)
        
        textLabel.textColor = .gray
        textLabel.numberOfLines = 0
        textLabel.textAlignment = .center
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(textLabel)
        
        activityIndicator.alpha = 0
        textLabel.alpha = 0
        
        NSLayoutConstraint.activate([
            activityIndicator.centerXAnchor.constraint(equalTo: self.centerXAnchor),
            activityIndicator.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            textLabel.topAnchor.constraint(equalTo: activityIndicator.bottomAnchor),
            textLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 20),
            textLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -20)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    class func showInView(view: UIView, text: String? = nil) {
        let hud = view.viewWithTag(HUDView.tag) as? HUDView ?? HUDView()
        view.addSubview(hud)
        hud.textLabel.text = text
        hud.activityIndicator.startAnimating()
        hud.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            hud.topAnchor.constraint(equalTo: view.topAnchor),
            hud.leftAnchor.constraint(equalTo: view.leftAnchor),
            hud.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            hud.rightAnchor.constraint(equalTo: view.rightAnchor)
        ])
        
        UIView.animate(withDuration: 0.5) {
            hud.activityIndicator.alpha = 1
            hud.textLabel.alpha = 1
        }
    }
    
    class func showErrorInView(view: UIView, text: String) {
        let hud = view.viewWithTag(HUDView.tag) as? HUDView ?? HUDView()
        hud.activityIndicator.stopAnimating()
        hud.textLabel.text = text
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            HUDView.removeFromView(view: view)
        }
    }
    
    class func removeFromView(view: UIView) {
        guard let hud = view.viewWithTag(HUDView.tag) as? HUDView else { return }
        
        UIView.animate(withDuration: 0.5) {
            hud.activityIndicator.alpha = 0
            hud.textLabel.alpha = 0
        } completion: { _ in
            hud.removeFromSuperview()
        }
    }
}
