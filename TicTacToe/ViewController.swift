//
//  ViewController.swift
//  TicTacToe
//
//  Created by Sathaporn Sunthornpan on 10/10/2560 BE.
//  Copyright © 2560 Sathaporn Sunthornpan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    @IBOutlet weak var btn9: UIButton!
    @IBOutlet weak var btn8: UIButton!
    @IBOutlet weak var btn7: UIButton!
    @IBOutlet weak var btn6: UIButton!
    @IBOutlet weak var btn5: UIButton!
    @IBOutlet weak var btn4: UIButton!
    @IBOutlet weak var btn3: UIButton!
    @IBOutlet weak var btn2: UIButton!
    @IBOutlet weak var btn1: UIButton!
    
    @IBAction func btnSelectEvent(_ sender: Any) {
        let btnSelect = sender as! UIButton
        playGame(buSelect: btnSelect)
    }
    
    var ActivePlayer = 1
    var player1 = [Int]()
    var player2 = [Int]()
    func playGame(buSelect:UIButton) {
        if ActivePlayer == 1 {
            buSelect.setTitle("X", for: UIControlState.normal)
            buSelect.backgroundColor = UIColor(red: 32/255, green: 192/255, blue: 243/255, alpha: 0.7)
            player1.append(buSelect.tag)
            ActivePlayer = 2
            //print(player1)
            autoPlay()
        }
        else {
            buSelect.setTitle("O", for: UIControlState.normal)
            buSelect.backgroundColor = UIColor(red: 88/255, green: 231/255, blue: 147/255, alpha: 0.7)
            player2.append(buSelect.tag)
            ActivePlayer = 1
            //print(player2)
        }
        buSelect.isEnabled = false
        findWinner()
    }
    
    func findWinner() {
        var winner = -1
        
        // row1
        if (player1.contains(1) && player1.contains(2) && player1.contains(3)) {
            winner = 1
        }
        if (player2.contains(1) && player2.contains(2) && player2.contains(3)) {
            winner = 2
        }
        
        // row2
        if (player1.contains(4) && player1.contains(5) && player1.contains(6)) {
            winner = 1
        }
        if (player2.contains(4) && player2.contains(5) && player2.contains(6)) {
            winner = 2
        }
        
        // row3
        if (player1.contains(7) && player1.contains(8) && player1.contains(9)) {
            winner = 1
        }
        if (player2.contains(7) && player2.contains(8) && player2.contains(9)) {
            winner = 2
        }
        
        // col1
        if (player1.contains(1) && player1.contains(4) && player1.contains(7)) {
            winner = 1
        }
        if (player2.contains(1) && player2.contains(4) && player2.contains(7)) {
            winner = 2
        }
        
        // col2
        if (player1.contains(2) && player1.contains(5) && player1.contains(8)) {
            winner = 1
        }
        if (player2.contains(2) && player2.contains(5) && player2.contains(8)) {
            winner = 2
        }
        
        // col3
        if (player1.contains(3) && player1.contains(6) && player1.contains(9)) {
            winner = 1
        }
        if (player2.contains(3) && player2.contains(6) && player2.contains(9)) {
            winner = 2
        }
        
        // diagonal1
        if (player1.contains(1) && player1.contains(5) && player1.contains(9)) {
            winner = 1
        }
        if (player2.contains(1) && player2.contains(5) && player2.contains(9)) {
            winner = 2
        }
        
        // diagonal2
        if (player1.contains(3) && player1.contains(5) && player1.contains(7)) {
            winner = 1
        }
        if (player2.contains(3) && player2.contains(5) && player2.contains(7)) {
            winner = 2
        }
        
        if winner != -1 {
            var msg = ""
            if winner == 1 {
                msg = "Player 1 is winner"
            }
            else {
                msg = "Player 2 is winner"
            }
            print(msg)
            // show alert
            let alert = UIAlertController(title: "Winner", message: msg, preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil))
            //alert.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    }
    
    func autoPlay() {
        // scan empty cells
        var emptyCells = [Int]()
        
        for index in 1...9 {
            if !( player1.contains(index) || player2.contains(index) ) {
                emptyCells.append(index)
            }
        }
        
        let randIndex = arc4random_uniform(UInt32(emptyCells.count))
        let cellID = emptyCells[Int(randIndex)]
        var buSelect:UIButton?
        
        switch cellID {
        case 1:
            buSelect = btn1
        case 2:
            buSelect = btn2
        case 3:
            buSelect = btn3
        case 4:
            buSelect = btn4
        case 5:
            buSelect = btn5
        case 6:
            buSelect = btn6
        case 7:
            buSelect = btn7
        case 8 :
            buSelect = btn8
        case 9:
            buSelect = btn9
        default:
            buSelect = btn1
        }
        
        playGame(buSelect: buSelect!)
    }
}

