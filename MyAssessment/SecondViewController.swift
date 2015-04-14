//
//  SecondViewController.swift
//  MyAssessment
//
//  Created by Tony Pham on 4/14/15.
//  Copyright (c) 2015 Tony Pham. All rights reserved.
//

import UIKit

protocol SecondViewDelegate {
    func buttonDidPress(buttonTitle: String)
}

class SecondViewController: UIViewController, UINavigationControllerDelegate {

    var btnNumber: Int!
    var bgColor: UIColor!
    var delegate: SecondViewDelegate!
    var isPopVCByBackButton = true
    
    @IBOutlet weak var buttonPressedLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.delegate = self
        buttonPressedLabel.text = "button pressed is \(btnNumber)"
        view.backgroundColor = bgColor
    }
    
    override func viewDidDisappear(animated: Bool) {
        
    }
    

    @IBAction func showFirstView(sender: UIButton) {
        self.navigationController?.popViewControllerAnimated(true)
        isPopVCByBackButton = false;
        
        switch sender.tag {
        case 1: self.delegate.buttonDidPress("ONE")
        case 2: self.delegate.buttonDidPress("TWO")
        default: self.delegate.buttonDidPress("THREE")
        }

    }
    
    func navigationController(navigationController: UINavigationController, willShowViewController viewController: UIViewController, animated: Bool) {
        if viewController.isKindOfClass(FirstViewController) && isPopVCByBackButton == true {
            self.delegate.buttonDidPress("None")
        }
    }
}
