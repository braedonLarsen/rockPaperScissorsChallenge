//
//  ViewController.swift
//  rockPaperScissorsChallenge
//
//  Created by BRAEDON LARSEN on 11/11/22.
//

import UIKit
class AppData {
    static var playerCount = false
    static var roundCount = 0
    static var p1Choice = [false,false,false]
    static var p2Choice = [false,false,false]
    
    // 1 is P1 w, 2 is P2 w, 0 is draw
    //P1 Rock Paper Scissors
    //P2
  //Rock  0     1      2
 //Paper  2     0      1
//Scissor 1     2      0
    static var logicData = [[Int]]()
    //[[0,1,2][2,0,1][1,2,0]]
//    static func stuffIn()
//    {
//        for i in 0...2
//        {
//            for j in 0...1
//            {
//                logicData[i][j] = 7
//            }
//
//        }
//    }
}
class ViewController: UIViewController {

    @IBOutlet var p1Outlet: UIButton!
    @IBOutlet var p2Outlet: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func p1Action(_ sender: UIButton) {
        performSegue(withIdentifier: "nextScreen", sender: self)
    }
    @IBAction func p2Action(_ sender: UIButton) {
        AppData.playerCount = true
        performSegue(withIdentifier: "nextScreen", sender: self)
    }
    
    
    
    


}

