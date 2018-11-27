//
//  Region.swift
//  TickIdentifierCurrent
//
//  Created by Ryan  Bilodeau on 8/6/18.
//  Copyright © 2018 Ryan Bilodeau. All rights reserved.
//

import Foundation

struct Region {
    let regionE: RegionE
    let name: String
    
    init(state: State) {
        switch state.nameE {
        case .None, .Maine, .NewHampshire, .Massachusetts, .Vermont, .NewYork, .Connecticut, .RhodeIsland, .NewJersey, .Pennsylvania:
            self.regionE = .NorthEast
            self.name = "North-East"
        case .Ohio, .Indiana, .Illinois, .Michigan, .Wisconsin, .Iowa, .Missouri, .Kansas, .Nebraska, .SouthDakota, .NorthDakota, .Minnesota:
            self.regionE = .MidWest
            self.name = "Mid-West"
        case .Alasaka, .Hawaii, .Washington, .Idaho, .Montana, .Wyoming, .Oregon, .California, .Nevada, .Utah, .Colorado, .Arizona, .NewMexico:
            self.regionE = .West
            self.name = "West"
        case .Delaware, .Maryland, .WestVirginia, .Virginia, .Kentucky, .NorthCarolina, .Tennessee, .SouthCarolina, .Georgia, .Alabama, .Florida, .Mississippi, .Louisiana, .Arkansas, .Oklahoma, .Texas:
            self.regionE = .South
            self.name = "South"
        }
    }
    init(regionE: RegionE) {
        self.regionE = regionE
        self.name = Region.getName(regionE: regionE)
    }
    
    static func getName(regionE: RegionE) -> String {
        switch regionE {
        case .NorthEast:
            return "North-East"
        case .MidWest:
            return "Mid-West"
        case .West:
            return "West"
        case .South:
            return "South"
        }
    }
}

enum RegionE {
    case NorthEast
    case MidWest
    case West
    case South
}























