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
           store = choice.rock
       }
        if i == 1
        {
            store = choice.paper
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
        print("changing case")
         if c == 0
        {
           store = choice.rock
             print("case now rock")
       }
        if c == 1
        {
            store = choice.paper
            print("case now paper")
        }
        if c == 2
        {
            store = choice.scissors
            print("case now scissors")
        }
        else {
            store = choice.paper
        }
    }
    func getCase() -> Int
    {
        if store == choice.rock
        {
            return 0
        }
        if store == choice.paper
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
    @IBOutlet weak var playerTwoImage: UIImageView!
    @IBOutlet weak var playerOneImage: UIImageView!
    @IBOutlet weak var p2Scissors: UIButton!
    
    var p1Pick = false
    var p2Pick = false
    var roundResult = 0
    var press = 0
    var p1Wins = 0
    var p2Wins = 0
    var output = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        if AppData.playerCount == true
        {
            playerTwoSegments.isHidden = true
        }
        else{
            playerTwoSegments.isHidden = false
        }
    
       
       
      
        
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
        let active = playerOneSegments.selectedSegmentIndex
        print("segment \(active)")
        switch active
        {
        case 0: AppData.p1Choice.changeCase(c: 0); print("p1 picked rock")
        case 1: AppData.p1Choice.changeCase(c: 1); print("p1 picked paper")
        case 2: AppData.p1Choice.changeCase(c: 2); print("p1 picked scissors")
        default: break
        }
        p1Pick = true
        if AppData.playerCount == true{
            print("computer go")
            AppData.p2Choice.changeCase(c:computerChoice())
            p2Pick = true
        }
        print(p1Pick)
        
    }
    
    @IBAction func p1ConfirmAction(_ sender: Any) {
        print("p1confirm")
        if AppData.playerCount == true
        {
            p1Pick = true
            p2Pick = true
        }
        else {p1Pick = true}
        imageUpdate()
        logicConvert()
    }
    
    @IBAction func p2ConfirmAction(_ sender: UITapGestureRecognizer) {
        p2Pick = true
        imageUpdate()
        logicConvert()
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
    
 



    func imageUpdate()
    {
        print("p1 \(AppData.p1Choice.getCase())")
        print("p2 \(AppData.p2Choice.getCase())")
        if AppData.p1Choice.getCase() == 0
        {
            playerOneImage.image = UIImage(named: "rocks.png")
        }
        else if AppData.p1Choice.getCase() == 1
        {
            print("paper Image")
            playerOneImage.image = UIImage(named: "paper.png")
        }
        else
        {
            playerOneImage.image = UIImage(named: "scissors.png")
        }
        if AppData.p2Choice.getCase() == 0
        {
            playerTwoImage.image = UIImage(named: "rocks.png")
        }
        else if AppData.p2Choice.getCase() == 1
        {
            playerTwoImage.image = UIImage(named: "paper.png")
        }
        else
        {
            playerTwoImage.image = UIImage(named: "scissors.png")
        }
    }
    func computerChoice() -> Int
    {
         output = Int.random(in:0..<3)
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
    func logicConvert()
    {
        print("converting logic")
        var input = logicCheck()
        print(input)
        switch input
        {
        case 1: resultOutlet.text = "\(AppData.name!) Wins"
        case 2: resultOutlet.text = "Player Two Wins"
        default: resultOutlet.text = "Its a draw"
        }
        gameOver()
    }

    func logicCheck() -> Int
    {
        if goOnCheck() == true
        {
            print("logic go")
            var p1Select = AppData.p1Choice.getCase()
            var p2Select = AppData.p2Choice.getCase()
            print("p1Picked\(p1Select)") ; print("p2picked\(p2Select)")
            AppData.roundsDone += 1
            if p1Select == 0 //p1 plays rock
            {
                if p2Select == 0
                {
                    
                    return 0
                }
                if p2Select == 1
                {
                    p2Wins += 1
                    return 2
                }
                if p2Select == 2
                {
                    p1Wins += 1
                    return 1
                }
            }
            else if p1Select == 1 //p1 plays paper
            {
                if p2Select == 0
                {
                    p1Wins += 1
                    return 1
                }
                if p2Select == 1
                {
                    return 0
                }
                if p2Select == 2
                {
                    p2Wins += 1
                    return 2
                }
            }
            else //p1 plays scissors
            {
                if p2Select == 0
                {
                    p2Wins += 1
                    return 2
                }
                if p2Select == 1
                {
                    p1Wins += 1
                    return 1
                }
                if p2Select == 2
                {
                    return 0
                }
            }
            
        }
    return 0
    }
    func gameOver()
    {
        if AppData.roundsDone >= AppData.roundCount
        {
            AppData.roundsDone = 0
            var whoWon = 0
            playerOneSegments.isHidden = true
            playerTwoSegments.isHidden = true
            if p2Wins > p1Wins
            {
                whoWon = 2
            }
            else if p1Wins > p2Wins
            {
                whoWon = 1
            }
            var textOut = ""
            switch whoWon
            {
            case 1: textOut = "\(AppData.name!) Won!"
            case 2: textOut = "Player 2 Won!"
            default: textOut = "It's a Draw!"
            }
            resultOutlet.text = textOut
            
        }
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
