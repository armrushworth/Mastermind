//
//  ViewController.swift
//  Mastermind
//
//  Created by Rushworth, Ashley on 04/11/2019.
//  Copyright © 2019 Rushworth, Ashley. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var keyboardViewHeight: NSLayoutConstraint!
    
    override func viewDidLoad() {
        NotificationCenter.default.addObserver(self, selector: #selector(orientationChanged), name:  Notification.Name("UIDeviceOrientationDidChangeNotification"), object: nil)
        super.viewDidLoad()
        setWidth()
    }
    
    @objc func orientationChanged() {
        setWidth()
    }
    
    func setWidth() {
        let screenRect = UIScreen.main.bounds
        let screenWidth = screenRect.size.width
        keyboardViewHeight.constant = screenWidth > 400 ? 100 : 200
    }
}

