//
//  MenuViewController.swift
//  Mastermind
//
//  Created by Rushworth, Ashley on 06/11/2019.
//  Copyright © 2019 Rushworth, Ashley. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {
    var wins = Int()
    var losses = Int()
    
    @IBOutlet weak var recordLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    // fetch and display number of wins and losses
    override func viewWillAppear(_ animated: Bool) {
        wins = UserDefaults.standard.integer(forKey: "wins")
        losses = UserDefaults.standard.integer(forKey: "losses")
        recordLabel.text = "Wins: \(wins)\nLosses: \(losses)"
    }
    
    // pass wins and losses through segue
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toGame" {
            let viewController = segue.destination as! ViewController
            viewController.wins = wins
            viewController.losses = losses
        }
    }
}
