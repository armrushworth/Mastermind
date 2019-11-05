//
//  ViewController.swift
//  Mastermind
//
//  Created by Rushworth, Ashley on 04/11/2019.
//  Copyright © 2019 Rushworth, Ashley. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    var generatedPattern = [String]()
    var selectionArray = [String]()
    var guesses = [[String]]()
    var feedback = [[Int]]()
    
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
    @IBOutlet weak var outputTable: UITableView!
    
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
        guesses.append(selectionArray)
        outputTable.reloadData()
        checkGuess()
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
        generatePattern()
        for i in 0 ..< generatedPattern.count {
            print(generatedPattern[i])
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return guesses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "tableCell")
        let guess = guesses[indexPath.row]
        var blobs = [String]()
        
        // display colours guessed
        for i in 0 ..< guess.count {
            let imageView = UIImageView(frame: CGRect(x: i * 48 + 74, y: 2, width: 40, height: 40))
            imageView.image = UIImage(named: guess[i])
            cell.contentView.addSubview(imageView)
        }
        
        // populate array with correct feedback blobs
        for _ in 0 ..< feedback[indexPath.row][0] {
            blobs.append("blobBlack")
        }
        for _ in 0 ..< feedback[indexPath.row][1] - feedback[indexPath.row][0] {
            blobs.append("blobWhite")
        }
        
        // display feedback blobs
        for i in 0 ..< blobs.count {
            let imageView = UIImageView(frame: CGRect(x: i / 2 * 18 + 266, y: i % 2 * 18 + 2, width: 20, height: 20))
            imageView.image = UIImage(named: blobs[i])
            cell.contentView.addSubview(imageView)
        }
        
        return cell
    }
    
    func generatePattern() {
        let colours = ["blue", "green", "grey", "orange", "red", "yellow"]
        
        // generate pattern of 4 colours
        for _ in 0 ... 3 {
            generatedPattern.append(colours.randomElement()!)
        }
    }
    
    func updateInputSelection(delete: Bool) {
        // get input selection to delete or update
        let selectionCount = delete ? selectionArray.count + 1 : selectionArray.count
        
        // delete or update input selection image
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
        // enable delete button if there are colours selected
        deleteButton.isEnabled = selectionArray.count == 0 ? false : true
        
        // disable colour buttons and enable go button if 4 colours have been selected
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
    
    func checkGuess() -> Bool {
        // return true if all colours are in the correct position
        if (generatedPattern.elementsEqual(selectionArray)) {
            return true
            
        } else {
            var generatedColoursCount: [String: Int] = [:]
            var guessedColoursCount: [String: Int] = [:]
            var correctPositionsCount = 0
            var correctColoursCount = 0
            
            for i in 0 ..< selectionArray.count {
                // count the number of each colour in generatedPattern and selectionArray
                generatedColoursCount[generatedPattern[i]] = (generatedColoursCount[generatedPattern[i]] ?? 0) + 1
                guessedColoursCount[selectionArray[i]] = (guessedColoursCount[selectionArray[i]] ?? 0) + 1
                
                // count the number of colours in the correct position
                if (selectionArray[i] == generatedPattern[i]) {
                    correctPositionsCount += 1
                }
            }
            
            // count the number of colours guessed correctly regardless of position
            for (key, value) in guessedColoursCount {
                if (generatedColoursCount[key] != nil) {
                    if (value > generatedColoursCount[key]!) {
                        correctColoursCount += generatedColoursCount[key]!
                    } else {
                        correctColoursCount += value
                    }
                }
            }
            
            // append feedback onto array
            feedback.append([correctPositionsCount, correctColoursCount])
        }
        return false
    }
}

