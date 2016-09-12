//
//  GameChoice.swift
//  MyRockPaperScissors
//
//  Created by Komari Herring on 9/12/16.
//  Copyright © 2016 The Iron Yard. All rights reserved.
//

import Foundation

enum GameChoice

{
    case Rock
    case Paper
    case Scissors
    
    init()
    
    {
        switch(arc4random_uniform(3))
        {
            
        case 0:
            self = Rock
        case 1:
            self = Paper
        default:
            self = Scissors
        }
    }
}