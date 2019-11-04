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
    @IBOutlet weak var firstSelection: UIImageView!
    @IBOutlet weak var secondSelection: UIImageView!
    @IBOutlet weak var thirdSelection: UIImageView!
    @IBOutlet weak var fourthSelection: UIImageView!
    @IBAction func blueCircle(_ sender: Any) {
    }
    @IBAction func greenCircle(_ sender: Any) {
    }
    @IBAction func greyCircle(_ sender: Any) {
    }
    @IBAction func orangeCircle(_ sender: Any) {
    }
    @IBAction func redCircle(_ sender: Any) {
    }
    @IBAction func yellowCirlce(_ sender: Any) {
    }
    @IBAction func backButton(_ sender: Any) {
    }
    @IBAction func goButton(_ sender: Any) {
    }
    override func viewDidLoad() {
        inputSelection.layer.borderWidth = 1
        inputSelection.layer.borderColor = UIColor.separator.cgColor
    }
}

