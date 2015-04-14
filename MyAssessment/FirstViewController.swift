//
//  FirstViewController.swift
//  MyAssessment
//
//  Created by Tony Pham on 4/14/15.
//  Copyright (c) 2015 Tony Pham. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, SecondViewDelegate {

    @IBOutlet weak var buttonPressedLabel: UILabel!
    
    @IBAction func showSecondView(sender: UIButton) {
        self.performSegueWithIdentifier("showSecondViewController", sender: sender)
    }
    
    // MARK: - Navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showSecondViewController" {
            let button = sender as! UIButton

            var secondVC = segue.destinationViewController as! SecondViewController
            secondVC.delegate = self
            secondVC.btnNumber = button.tag
            
            switch button.tag {
            case 1: secondVC.bgColor = .blueColor()
            case 2: secondVC.bgColor = .redColor()
            default: secondVC.bgColor = .greenColor()
            }
        }
    }
    
    // MARK: - SecondViewDelegate
    func buttonDidPress(buttonTitle: String) {
        buttonPressedLabel.text = "button pressed is \(buttonTitle)"
    }
}
