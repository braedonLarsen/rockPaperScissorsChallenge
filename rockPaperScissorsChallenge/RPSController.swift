//
//  RPSController.swift
//  rockPaperScissorsChallenge
//
//  Created by BRAEDON LARSEN on 11/15/22.
//

import UIKit
//button label, stackview, imageview, navigation controller, constraints, higs, textfield, segment controller
class option
{
    enum choice{
        case rock
        case paper
        case scissors
    }
    var store: choice
    init(i: Int )
    {
       if i == 0
        {
           store = choice.paper
       }
        if i == 1
        {
            store = choice.rock
        }
        if i == 2
        {
            store = choice.scissors
        }
        else {
            store = choice.paper 
        }
    }
    func changeCase(c: Int)
    {
         if c == 0
        {
           store = choice.paper
       }
        if c == 1
        {
            store = choice.rock
        }
        if c == 2
        {
            store = choice.scissors
        }
        else {
            store = choice.paper
        }
    }
    func getCase() -> Int
    {
        if store == choice.paper
        {
            return 0
        }
        if store == choice.rock
        {
            return 1
        }
        if store == choice.scissors
        {
            return 2
        }
        else {return 0}
    }
}
//Programming Concepts: variables, if else, arrays, functions, github, switch statemnets
//UI Elements: Button, Label, HIGS, Navigation Controller, slider
class RPSController: UIViewController {

    
    @IBOutlet weak var playerOneSegments: UISegmentedControl!
    @IBOutlet weak var resultOutlet: UILabel!
    @IBOutlet weak var playerTwoSegments: UISegmentedControl!
    @IBOutlet weak var p2Scissors: UIButton!
    
    var p1Pick = false
    var p2Pick = false
    var roundResult = 0
    var press = 0
    override func viewDidLoad() {
        super.viewDidLoad()
       
       
      
        
        // Do any additional setup after loading the view.
        roundResult = logicCheck()
         
          if roundResult == 1
         {
             resultOutlet.text = "\(AppData.name) Victory"
         }
         else if roundResult == 2
         {
             resultOutlet.text = "P2 Victory"
         }
         else { resultOutlet.text = "Draw"}
             print("running")

    }
    

  
    
    @IBAction func playerOneActions(_ sender: Any) {
        var active = playerOneSegments.selectedSegmentIndex
        switch active
        {
        case 0: AppData.p1Choice.changeCase(c: 0)
        case 1: AppData.p1Choice.changeCase(c: 1)
        case 2: AppData.p1Choice.changeCase(c: 2)
        default: break
        }
        p1Pick = true
        if AppData.playerCount == true{
            AppData.p2Choice.changeCase(c:computerChoice())
            p2Pick = true
            print(AppData.p1Choice)
            print(p1Pick)
            
        }
        
        
    }
    @IBAction func playerTwoActions(_ sender: Any) {
        var active = playerTwoSegments.selectedSegmentIndex
        switch active
        {
        case 0: AppData.p2Choice.changeCase(c:0)
        case 1: AppData.p2Choice.changeCase(c:1)
        case 2: AppData.p2Choice.changeCase(c:2)
        default: break 
        }
        p2Pick = true
        print(AppData.p2Choice)
        print(p2Pick)
    }
    
 



    
    func computerChoice() -> Int
    {
        var output = Int.random(in:0..<3)
        return output
    }
    //0 is tie 1 is p1 2 is p2
   
    func goOnCheck() -> Bool
    {
        if p1Pick && p2Pick == true
        {
            return true
        }
        else{return false }
    }
    func logicCheck() -> Int
    {
        if goOnCheck() == true
        {
            print("logic go")
            var p1Select = AppData.p1Choice.getCase()
            var p2Select = AppData.p2Choice.getCase()
            if p1Select == 0
            {
                if p2Select == 0
                {
                    return 0
                }
                if p2Select == 1
                {
                    return 1
                }
                if p2Select == 2
                {
                    return 2
                }
            }
            else if p1Select == 1
            {
                if p2Select == 0
                {
                    return 2
                }
                if p2Select == 1
                {
                    return 0
                }
                if p2Select == 2
                {
                    return 1
                }
            }
            else
            {
                if p2Select == 0
                {
                    return 1
                }
                if p2Select == 1
                {
                    return 2
                }
                if p2Select == 2
                {
                    return 0
                }
            }
            
        }
    return 0
    }
    
//    func logicCheck() -> Int
//    {    //     rock paper scissors
//        //Rock  0     1      2
//       //Paper  2     0      1
//      //Scissor 1     2      0
//       print("logic check")
//       //parse the bool arrays for true value
//        var p1 = AppData.p1Choice
//        var p1Store = 0
//        for i in 0...2
//        {
//          if p1[i] == true
//          {
//              p1Store = i
//              print(p1Store)
//          }
//        }
//        print(p1)
//        var p2 = AppData.p2Choice
//        var p2Store = 0
//        for i in 0...2
//        {
//          if p2[i] == true
//          {
//              p2Store = i
//              print(p2Store)
//          }
//        }
//
//        print(p2)
//        if p1Store == p2Store
//        {
//            return 0
//        }
//        if p1Store == 2 && p2Store == 0
//        {
//            print("other option")
//            return 2
//        }
//        if p1Store == 1 && p2Store == 0
//        {
//
//            print("other option")
//            return 1
//
//        }
//        if p1Store == 2 && p2Store == 1
//        {
//            print("other option")
//            return 1
//
//        }
//        if p1Store == 0 && p2Store == 1
//        {
//            print("other option")
//            return 1
//
//        }
//        if p1Store == 0 && p2Store == 2
//        {
//            print("other option")
//            return 1
//
//        }
//        if p1Store == 1 && p2Store == 2
//        {
//            print("other option")
//            return 2
//        }
//        else
//        {
//            return 0
//        }
//    }
//    func textOutput (value: Int)-> String
//    {
//        if (value == 1)
//        {
//            return "Player One Won"
//        }
//        if (value == 2)
//        {
//            return "Player Two Won "
//        }
//        else
//        {
//            return "Its a Draw"
//        }
//    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
