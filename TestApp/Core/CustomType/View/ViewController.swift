//
//  ViewController.swift
//  TestApp
//
//  Created by Yurii Bosov on 28.11.2020.
//

import UIKit

class ViewController: UIViewController {

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        self.setup()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        self.setup()
    }
    
    deinit {
        #if DEBUG
        print("deinit \(self.className)")
        #endif
    }
    
    func setup() {
        //
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = Constant.Color.defaultBackgroundColor
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .all
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .default
    }
    
    @IBAction func hideKeyboard() {
        self.view.endEditing(true)
    }
}

