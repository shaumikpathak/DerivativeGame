//
//  ViewController.swift
//  DerivativeGame
//
//  Created by Brandon on 1/20/18.
//  Copyright © 2018 Brandon. All rights reserved.
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
    
    

    @IBOutlet weak var CenterLabel: UITextField!
    @IBOutlet weak var negativeSign: UIButton!
    @IBOutlet weak var cosButton: UIButton!
    @IBOutlet weak var sinButton: UIButton!
    @IBOutlet weak var tanButton: UIButton!
    @IBOutlet weak var triesLeftLabel: UITextField!
    @IBOutlet weak var scoreLabel: UITextField!
    @IBOutlet weak var resetButton: UIButton!
    
    
    @IBAction func tapRecognizer(_ sender: Any) {
        if (sinButton.currentTitle == "sin")
        {
            sinButton.setTitle("csc", for: .normal)
            cosButton.setTitle("sec", for: .normal)
            tanButton.setTitle("cot", for: .normal)
        }
        else
        {
            sinButton.setTitle("sin", for: .normal)
            cosButton.setTitle("cos", for: .normal)
            tanButton.setTitle("tan", for: .normal)
        }
        
    }
    
    func randomGen()
    {
        var random = arc4random_uniform(6)
        if (random == 0)
        {
            CenterLabel.text = "sin"
        }
        else if (random == 1)
        {
            CenterLabel.text = "cos"
        }
        else if (random == 2)
        {
            CenterLabel.text = "tan"
        }
        else if (random == 3)
        {
            CenterLabel.text = "sec"
        }
        else if (random == 4)
        {
            CenterLabel.text = "csc"
        }
        else if (random == 5)
        {
            CenterLabel.text = "cot"
        }
        
    }
    
    
    var score = 0
    var tempInput = ""
    var negativePressed = false
    
    
    @IBAction func handlerForResetButton(_ sender: Any) {
        score = 0
        randomGen()
        scoreLabel.text = "score: " + String(score)
    }
    
    @IBAction func handlerForSin(_ sender: Any) {
        if(CenterLabel.text == "cos" && sinButton.currentTitle == "sin")
        {
           tempInput += "sin"
        }
        
        if (CenterLabel.text == "cot" && sinButton.currentTitle == "csc")
        {
            tempInput += "csc"
        }
        
        if (CenterLabel.text == "csc" && sinButton.currentTitle == "csc")
        {
            tempInput += "csc"
        }
        
        if (tempInput == "cotcsc" && negativePressed)
        {
            randomGen()
            tempInput = ""
            negativePressed = false
            score += 1
            scoreLabel.text = "score: " + String(score);
            
        }
        else if (tempInput == "csccsc" && negativePressed)
        {
            randomGen()
            tempInput = ""
            negativePressed = false
            score += 1
            scoreLabel.text = "score: " + String(score);
        }
        else if (tempInput == "sin" && negativePressed)
        {
            randomGen()
            tempInput = ""
            negativePressed = false
            score += 1
            scoreLabel.text = "score: " + String(score)
        }
    }
    
    @IBAction func handlerForCos(_ sender: Any) {
        if(CenterLabel.text == "sin" && cosButton.currentTitle == "cos")
        {
            randomGen()
            score += 1
            scoreLabel.text = "score: " + String(score)
        }
        else if (CenterLabel.text == "tan" && cosButton.currentTitle == "sec")
        {
            tempInput += "sec"
        }
        else if (CenterLabel.text == "sec" && cosButton.currentTitle == "sec")
        {
            tempInput += "sec"
        }
        
        if (tempInput == "secsec")
        {
            randomGen()
            tempInput = ""
            score += 1
            scoreLabel.text = "score: " + String(score)
        }
        else if (tempInput == "tansec")
        {
            randomGen()
            tempInput = ""
            score += 1
            scoreLabel.text = "score: " + String(score)
        }
        
    }
    
    @IBAction func handlerForTan(_ sender: Any) {
            if (CenterLabel.text == "sec" && tanButton.currentTitle == "tan")
            {
                tempInput += "tan"
            }
            
            if (CenterLabel.text == "csc" && tanButton.currentTitle == "cot")
            {
                tempInput += "cot"
            }
            
            if (tempInput == "sectan")
            {
                //CenterLabel.text = "asdfjkl"
                randomGen()
                tempInput = ""
                score += 1
                scoreLabel.text = "score: " + String(score)
            }
            else if (tempInput == "csccot" && negativePressed)
            {
                randomGen()
                tempInput = ""
                negativePressed = false
                score += 1
                scoreLabel.text = "score: " + String(score)
            }
    }
    
    

    

    @IBAction func handlerForNegativeSign(_ sender: Any) {
        negativePressed = true
        
        if (tempInput == "csccot" || tempInput == "cotcsc")
        {
            randomGen()
            tempInput = ""
            score += 1
            scoreLabel.text = "score: " + String(score)
        }
        
        if (tempInput == "csccsc")
        {
            randomGen()
            tempInput = ""
            score += 1
            scoreLabel.text = "score: " + String(score)
        }
        
        if (tempInput == "sin")
        {
            randomGen()
            tempInput = ""
            score += 1
            scoreLabel.text = "score: " + String(score)
        }
    }
}
