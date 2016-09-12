//
//  ResultViewController.swift
//  MyRockPaperScissors
//
//  Created by Komari Herring on 9/12/16.
//  Copyright © 2016 The Iron Yard. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController
{
    
    
    @IBOutlet var myLabel: UILabel!
    
    @IBOutlet var myImageView: UIImageView!
    
    var resultString:String!
    var imageString:String!
    
    override func viewDidAppear(animated: Bool)
    {
        super.viewDidAppear(animated)
        
        print("image String: \(imageString.characters.count) ")
        myLabel.text = resultString
        myImageView.image  = UIImage(named: imageString)
        
        
    }
    
    
    @IBAction func playAgain(sender: AnyObject)
    {
        
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    
}
