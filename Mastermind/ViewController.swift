//
//  ViewController.swift
//  Mastermind
//
//  Created by Rushworth, Ashley on 04/11/2019.
//  Copyright © 2019 Rushworth, Ashley. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var inputSelection: UIView!
    override func viewDidLoad() {
        inputSelection.layer.borderWidth = 1
        inputSelection.layer.borderColor = UIColor.separator.cgColor
    }
}

