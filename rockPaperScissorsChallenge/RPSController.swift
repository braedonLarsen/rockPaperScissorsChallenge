//
//  RPSController.swift
//  rockPaperScissorsChallenge
//
//  Created by BRAEDON LARSEN on 11/15/22.
//

import UIKit

class RPSController: UIViewController {

    
    @IBOutlet weak var p1Rock: UIButton!
    @IBOutlet weak var p1Paper: UIButton!
    @IBOutlet weak var p1Scissors: UIButton!
    @IBOutlet weak var p2Rock: UIButton!
    @IBOutlet weak var p2Paper: UIButton!
    @IBOutlet weak var p2Scissors: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func p1RockAction(_ sender: UIButton) {
        AppData.p1Choice[0] = true
    }
    @IBAction func p1PaperAction(_ sender: UIButton) {
        AppData.p1Choice[1] = true

    }
    @IBAction func p1ScissorsAction(_ sender: UIButton) {
        AppData.p1Choice[2] = true

    }
    @IBAction func p2RockAction(_ sender: UIButton) {
        AppData.p2Choice[0] = true

    }
    @IBAction func p2PaperAction(_ sender: UIButton) {
        AppData.p2Choice[1] = true

    }
    
    @IBAction func p2ScissorsAction(_ sender: UIButton) {
        AppData.p2Choice[2] = true

    }
    
    
    
    
    
    
    
    
    
    
    
    
    func buildOne()
    {
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
