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
            print(player1)
        }
        else {
            buSelect.setTitle("O", for: UIControlState.normal)
            buSelect.backgroundColor = UIColor(red: 88/255, green: 231/255, blue: 147/255, alpha: 0.7)
            player2.append(buSelect.tag)
            ActivePlayer = 1
            print(player2)
        }
        buSelect.isEnabled = false
    }
}

