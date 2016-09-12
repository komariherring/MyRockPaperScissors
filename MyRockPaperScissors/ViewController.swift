//
//  ViewController.swift
//  MyRockPaperScissors
//
//  Created by Komari Herring on 9/12/16.
//  Copyright © 2016 The Iron Yard. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var rock: UIButton!
    
    @IBOutlet var scissors: UIButton!
    @IBOutlet var paper: UIButton!
    
    var userOption:GameChoice!
    var computerOption:GameChoice!
    
    let theWinner = [ GameChoice.Rock : "Rock Crushes Scissors",
                       GameChoice.Paper: " Paper Covers Rock",
                       GameChoice.Scissors : "Scissors Cuts Paper"]
    
    let moreWinner = [ GameResult.Winner: ". You Win!"
        ,GameResult.Loser : ". You Lose!"
        ,GameResult.Tie : "Its A Tie"]
    
    
    
    @IBAction func makeChoice(sender: AnyObject)
    {
        
        switch(sender as! UIButton)
        {
        case rock:
            //do stuff
            userOption = .Rock
            computerOption = GameChoice()
            displayResult()
        case paper:
            //do stuff
            userOption = .Paper
            computerOption = GameChoice()
            displayResult()
        case scissors:
            //do stuff
            userOption = .Scissors
            computerOption = GameChoice()
            displayResult()
        default:
            print("handle value")
            
        }
        
    }
    
    func displayResult()
    {
        
        //get the result of the game
        let myGameResult = gameResult(userOption, computerOption: computerOption)
        // get the result string + image string
        let myResultString = gameResultText(myGameResult)
        // trigger the result view controller
        // pass it the result string + image string
        let myStoryBoard = UIStoryboard(name: "Main", bundle: nil)
        let myResultVC = myStoryBoard.instantiateViewControllerWithIdentifier("ResultView") as! ResultViewController
        
        myResultVC.resultString = myResultString
        
        if myGameResult == GameResult.Tie
        {
            myResultVC.imageString = myResultString.stringByReplacingOccurrencesOfString(" ", withString: "")
        }
        else
        {
            let tempString = myResultString.stringByReplacingOccurrencesOfString(moreWinner[myGameResult]!, withString: "")
            
            myResultVC.imageString = tempString.stringByReplacingOccurrencesOfString(" ", withString: "")
            
        }
        
        self.presentViewController(myResultVC, animated: true, completion: nil)
        
    }
    
    func gameResultText(gameResult:GameResult ) ->String
    {
        switch(gameResult)
        {
        case .Winner:
            return theWinner[userOption]! + moreWinner[gameResult]!
        case .Loser:
            return theWinner[computerOption]! + moreWinner[gameResult]!
        default:
            return moreWinner[gameResult]!
            
        }
    }
    
    func gameResult(userOption:GameChoice,computerOption:GameChoice) -> GameResult
    {
        switch(userOption,computerOption)
        {
        case (GameChoice.Rock,GameChoice.Scissors),(GameChoice.Paper,GameChoice.Rock),(GameChoice.Scissors,GameChoice.Paper):
            return GameResult.Winner
        case (GameChoice.Scissors,GameChoice.Rock),(GameChoice.Rock,GameChoice.Paper),(GameChoice.Paper, GameChoice.Scissors):
            return GameResult.Loser
        default:
            return GameResult.Tie
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    
    
}

