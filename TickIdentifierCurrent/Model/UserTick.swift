//
//  UserTick.swift
//  TickIdentifierCurrent
//
//  Created by Ryan  Bilodeau on 7/30/18.
//  Copyright © 2018 Ryan Bilodeau. All rights reserved.
//

import Foundation
import UIKit

class UserTick: NSObject, NSCoding {
    let image: UIImage
    let date: String
    let state: String   //Set to an empty string if there is no user state
    let tickClassString: String
    
    lazy var tickClass = {
       return Tick.getTick(abbreviation: tickClassString)!
    }()
    lazy var diseases = {
        return Diseases(tick: tickClass, state: state)!
    }()
    
    init(image: UIImage, date: String, state: String, tickClassString: String) {
        self.image = image
        self.date = date
        self.state = state
        self.tickClassString = tickClassString
    }
    
    required convenience init(coder aDecoder: NSCoder) {
        let image = aDecoder.decodeObject(forKey: "image") as! UIImage
        let date = aDecoder.decodeObject(forKey: "date") as! String
        let state = aDecoder.decodeObject(forKey: "state") as! String
        let tickClassString = aDecoder.decodeObject(forKey: "tickClassString") as! String
        
        self.init(image: image, date: date, state: state, tickClassString: tickClassString)
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(image, forKey: "image")
        aCoder.encode(date, forKey: "date")
        aCoder.encode(state, forKey: "state")
        aCoder.encode(tickClassString, forKey: "tickClassString")
    }
}

//Static functions
extension UserTick {
    //Save ticks
    static func saveTicks(ticks: [UserTick], completion: (() -> Void)?) {
        let userDefaults = UserDefaults.standard
        let encodedData: Data = NSKeyedArchiver.archivedData(withRootObject: ticks)
        userDefaults.set(encodedData, forKey: "savedUserTick")
        completion?()
    }
    
    //Get saved ticks
    static func getSavedTicks() -> [UserTick] {
        let userDefaults = UserDefaults.standard
        if let decoded  = userDefaults.object(forKey: "savedUserTick") as? Data {
            let decodedTicks = NSKeyedUnarchiver.unarchiveObject(with: decoded) as! [UserTick]
            return decodedTicks
        } else {
            return [UserTick]()
        }
    }
    
    //Append new tick then order array by newest date first
    static func appendAndOrderArray(append: UserTick, to: [UserTick]) -> [UserTick] {
        var ticks = to
        ticks.append(append)
        
        ticks = UserTick.orderArray(ticks: ticks)
        
        return ticks
    }
    
    //Order arry by newest date first
    static func orderArray(ticks: [UserTick]) -> [UserTick] {
        var ticks = ticks
        
        let formatter = DateFormatter()
        formatter.dateFormat = "MM.dd.yy"
        
        ticks.sort {
            return formatter.date(from: $0.date)! > formatter.date(from: $1.date)!
        }
        
        return ticks
    }
    
    //Get test ticks
    static func getTestTicks() -> [UserTick] {
        let testTicks = [UserTick(image: #imageLiteral(resourceName: "AmericanDogM"), date: "01.08.18", state: "Florida", tickClassString: "AmericanDogM"),
                         UserTick(image: #imageLiteral(resourceName: "BrownM"), date: "01.07.18", state: "", tickClassString: "BrownM"),
                         UserTick(image: #imageLiteral(resourceName: "DeerM"), date: "01.06.18", state: "", tickClassString: "DeerM"),
                         UserTick(image: #imageLiteral(resourceName: "EuropeanWoodM"), date: "01.05.18", state: "", tickClassString: "EuropeanWoodM"),
                         UserTick(image: #imageLiteral(resourceName: "GulfCoastM"), date: "01.04.18", state: "Maine", tickClassString: "GulfCoastM"),
                         UserTick(image: #imageLiteral(resourceName: "LoneStarM"), date: "01.03.18", state: "Maine", tickClassString: "LoneStarM"),
                         UserTick(image: #imageLiteral(resourceName: "WesternBlackleggedM"), date: "01.02.18", state: "Maine", tickClassString: "WesternBlackleggedM"),
                         UserTick(image: #imageLiteral(resourceName: "WoodM"), date: "01.01.18", state: "Maine", tickClassString: "WoodM"),]
        
        return testTicks
    }
}





