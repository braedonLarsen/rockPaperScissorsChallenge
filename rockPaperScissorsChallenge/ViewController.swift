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

