//
//  MyTicksViewController.swift
//  TickIdentifierCurrent
//
//  Created by Ryan  Bilodeau on 7/26/18.
//  Copyright © 2018 Ryan Bilodeau. All rights reserved.
//

import UIKit
import MapKit
import StoreKit

class MyTicks1ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var instructionUILabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var downArrowUIImage: UIImageView!
}

//Overridden functions and delegates
extension MyTicks1ViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
        
        if AppDelegate.userTicks.count > 0 {
            instructionUILabel.isHidden = true
        } else {
            instructionUILabel.isHidden = false
        }
        
        if AppDelegate.userTicks.count > 5 {
            downArrowUIImage.alpha = 1
        } else {
            downArrowUIImage.alpha = 0
        }
        
        tableView.rowHeight = tableView.frame.height / 5
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let userDefaults = UserDefaults.standard
        if userDefaults.integer(forKey: "launchTimes") == 2 {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                SKStoreReviewController.requestReview()
            }
        }
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? MyTicks2ViewController, let tick = sender as? UserTick {
            destination.userTick = tick
        }
    }
    
    //When a row is selected
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "goToDetailView", sender: AppDelegate.userTicks[indexPath.row])
    }
    //When a row is highlighted
    func tableView(_ tableView: UITableView, didHighlightRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! UserTickTableViewCell
        cell.backGroundUIView.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 0.1)
    }
    //When a row is unhighlighted
    func tableView(_ tableView: UITableView, didUnhighlightRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! UserTickTableViewCell
        cell.backGroundUIView.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
    }
    //Number of cells
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return AppDelegate.userTicks.count
    }
    //Called for each cell when it's displayed
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //Hide down arrow image if last cell is showing
        if indexPath.row == AppDelegate.userTicks.count - 1 {
            downArrowUIImage.stopAnimating()
            UIView.animate(withDuration: 0.25) {
                self.downArrowUIImage.alpha = 0
            }
        }
        
        return formatCell(tableView, cellForRowAt: indexPath)
    }
    //Called when a cell stops displaying (is dequeued)
    public func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        //Show down arrow image if last cell isn't showing
        if indexPath.row == AppDelegate.userTicks.count - 1 {
            downArrowUIImage.stopAnimating()
            UIView.animate(withDuration: 0.25) {
                self.downArrowUIImage.alpha = 1
            }
        }
    }
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return false
    }
}

extension MyTicks1ViewController {
    private func formatCell(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! UserTickTableViewCell
        let index = indexPath.row
        
        cell.backGroundUIView.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.1)
        cell.backGroundUIView.layer.cornerRadius = 8
        
        cell.userImage.image = AppDelegate.userTicks[index].image
        cell.userImage.contentMode = .scaleAspectFill
        cell.userImage.layer.cornerRadius = 8
        
        cell.commonNameUILabel.text = AppDelegate.userTicks[index].tickClass.commonName
        cell.dateUILabel.text = AppDelegate.userTicks[index].date
        
        return cell
    }
}



