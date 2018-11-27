//
//  LearnViewController.swift
//  TickIdentifierCurrent
//
//  Created by Ryan  Bilodeau on 7/25/18.
//  Copyright © 2018 Ryan Bilodeau. All rights reserved.
//

import UIKit

class LearnViewController: UIViewController {
    @IBAction func removalBtnPressed() {
        performSegue(withIdentifier: "goToRemoval", sender: nil)
    }
    @IBAction func avoidanceBtnPressed() {
        performSegue(withIdentifier: "goToAvoidance", sender: nil)
    }
    @IBAction func factsBtnPressed() {
        performSegue(withIdentifier: "goToFacts", sender: nil)
    }
    @IBAction func identifyBtnPressed() {
        performSegue(withIdentifier: "goToIdentify", sender: nil)
    }
    @IBAction func helpBtnPressed() {
        performSegue(withIdentifier: "goToHelp", sender: nil)
    }
}
