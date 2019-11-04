//
//  ViewController.swift
//  Mastermind
//
//  Created by Rushworth, Ashley on 04/11/2019.
//  Copyright © 2019 Rushworth, Ashley. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var selectionArray = [String]()
    
    @IBOutlet weak var inputSelection: UIView!
    @IBOutlet weak var firstSelection: UIImageView!
    @IBOutlet weak var secondSelection: UIImageView!
    @IBOutlet weak var thirdSelection: UIImageView!
    @IBOutlet weak var fourthSelection: UIImageView!
    @IBOutlet weak var blueCircle: UIButton!
    @IBOutlet weak var greenCircle: UIButton!
    @IBOutlet weak var greyCircle: UIButton!
    @IBOutlet weak var orangeCircle: UIButton!
    @IBOutlet weak var redCircle: UIButton!
    @IBOutlet weak var yellowCircle: UIButton!
    @IBOutlet weak var deleteButton: UIButton!
    @IBOutlet weak var goButton: UIButton!
    
    @IBAction func blueCircle(_ sender: Any) {
        selectionArray.append("blue")
        updateInputSelection(delete: false)
    }
    
    @IBAction func greenCircle(_ sender: Any) {
        selectionArray.append("green")
        updateInputSelection(delete: false)
    }
    
    @IBAction func greyCircle(_ sender: Any) {
        selectionArray.append("grey")
        updateInputSelection(delete: false)
    }
    
    @IBAction func orangeCircle(_ sender: Any) {
        selectionArray.append("orange")
        updateInputSelection(delete: false)
    }
    
    @IBAction func redCircle(_ sender: Any) {
        selectionArray.append("red")
        updateInputSelection(delete: false)
    }
    
    @IBAction func yellowCirlce(_ sender: Any) {
        selectionArray.append("yellow")
        updateInputSelection(delete: false)
    }
    
    @IBAction func deleteButton(_ sender: Any) {
        selectionArray.removeLast()
        updateInputSelection(delete: true)
    }
    
    @IBAction func goButton(_ sender: Any) {
        selectionArray.removeAll()
        firstSelection.image = nil
        secondSelection.image = nil
        thirdSelection.image = nil
        fourthSelection.image = nil
        updateButtonStates()
    }
    
    override func viewDidLoad() {
        inputSelection.layer.borderWidth = 1
        inputSelection.layer.borderColor = UIColor.separator.cgColor
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "tableCell")
        cell.textLabel?.text = "Hello"
        return cell
    }
    
    func updateInputSelection(delete: Bool) {
        let selectionCount = delete ? selectionArray.count + 1 : selectionArray.count
        switch selectionCount {
            case 1:
                firstSelection.image = delete ? nil : UIImage(named: selectionArray[selectionCount - 1])
            case 2:
                secondSelection.image = delete ? nil : UIImage(named: selectionArray[selectionCount - 1])
            case 3:
                thirdSelection.image = delete ? nil : UIImage(named: selectionArray[selectionCount - 1])
            default:
                fourthSelection.image = delete ? nil : UIImage(named: selectionArray[selectionCount - 1])
        }
        updateButtonStates()
    }
    
    func updateButtonStates() {
        deleteButton.isEnabled = selectionArray.count == 0 ? false : true
        
        if (selectionArray.count >= 4) {
            blueCircle.isEnabled = false
            greenCircle.isEnabled = false
            greyCircle.isEnabled = false
            orangeCircle.isEnabled = false
            yellowCircle.isEnabled = false
            redCircle.isEnabled = false
            goButton.isEnabled = true
        } else {
            blueCircle.isEnabled = true
            greenCircle.isEnabled = true
            greyCircle.isEnabled = true
            orangeCircle.isEnabled = true
            yellowCircle.isEnabled = true
            redCircle.isEnabled = true
            goButton.isEnabled = false
        }
    }
}

