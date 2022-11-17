//
//  RPSController.swift
//  rockPaperScissorsChallenge
//
//  Created by BRAEDON LARSEN on 11/15/22.
//

import UIKit

class RPSController: UIViewController {

    
    @IBOutlet weak var resultOutlet: UILabel!
    @IBOutlet weak var p1Rock: UIButton!
    @IBOutlet weak var p1Paper: UIButton!
    @IBOutlet weak var p1Scissors: UIButton!
    @IBOutlet weak var p2Rock: UIButton!
    @IBOutlet weak var p2Paper: UIButton!
    @IBOutlet weak var p2Scissors: UIButton!
    
    var press = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        
        var result = String(logicCheck())
            resultOutlet.text = result
        
        // Do any additional setup after loading the view.
    }
    

  
    @IBAction func p1RockAction(_ sender: UIButton) {
        p1Rock.backgroundColor = UIColor(named: "systemGreen")
        AppData.p1Choice[0] = true
        press += 1
        print(AppData.p1Choice)
    }
    @IBAction func p1PaperAction(_ sender: UIButton) {
        p1Paper.backgroundColor = UIColor(named: "systemGreen")
        AppData.p1Choice[1] = true
        press += 1
        print(AppData.p1Choice)

    }
    @IBAction func p1ScissorsAction(_ sender: UIButton) {
        p1Scissors.backgroundColor = UIColor(named: "systemGreen")
        AppData.p1Choice[2] = true
        press += 1
        print(AppData.p1Choice)

    }
    @IBAction func p2RockAction(_ sender: UIButton) {
        p2Rock.backgroundColor = UIColor(named: "systemGreen")
        AppData.p2Choice[0] = true
        press += 1
        print(AppData.p2Choice)

    }
    @IBAction func p2PaperAction(_ sender: UIButton) {
        p2Paper.backgroundColor = UIColor(named: "systemGreen")
        AppData.p2Choice[1] = true
        press += 1
        print(AppData.p2Choice)

    }
    @IBAction func p2ScissorsAction(_ sender: UIButton) {
        p2Scissors.backgroundColor = UIColor(named: "systemGreen")
        AppData.p2Choice[2] = true
        press += 1
        print(AppData.p2Choice)



    }
    
    
    
    
    
    
    
    
    
    
    
    
    func buildOne()
    {
        
    }
    //0 is tie 1 is p1 2 is p2
   
    
    func logicCheck() -> Int
    {
        //Rock  0     1      2
       //Paper  2     0      1
      //Scissor 1     2      0
       var p1 = AppData.p1Choice
       var p2 = AppData.p2Choice
        if p1.count == p2.count
        {
            return 0
        }
        if p1.count == 2 && p2.count == 0
        {
            return 2
        }
        if p1.count == 1 && p2.count == 0
        {
            return 1
        }
        if p1.count == 2 && p2.count == 1
        {
            return 1
        }
        if p1.count == 0 && p2.count == 1
        {
            return 2
        }
        if p1.count == 0 && p2.count == 2
        {
            return 1
        }
        if p1.count == 1 && p2.count == 2
        {
            return 2
        }
        else
        {
            return 0
        }
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
