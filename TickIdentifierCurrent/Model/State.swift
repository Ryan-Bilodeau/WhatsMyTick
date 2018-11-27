//
//  State.swift
//  TickIdentifierCurrent
//
//  Created by Ryan  Bilodeau on 7/18/18.
//  Copyright © 2018 Ryan Bilodeau. All rights reserved.
//

import Foundation

//Used to translate state string into Enum
struct State {
    let nameE: StateE
    let name: String
    
    init?(name: String) {
        switch name {
        case "AL", "Alabama":
            self.nameE = StateE.Alabama
            self.name = "Alabama"
        case "AK", "Alaska":
            self.nameE = StateE.Alasaka
            self.name = "Alasaka"
        case "AZ", "Arizona":
            self.nameE = StateE.Arizona
            self.name = "Arizona"
        case "AR", "Arkansas":
            self.nameE = StateE.Arkansas
            self.name = "Arkansas"
        case "CA", "California":
            self.nameE = StateE.California
            self.name = "California"
        case "CO", "Colorado":
            self.nameE = StateE.Colorado
            self.name = "Colorado"
        case "CT", "Connecticut":
            self.nameE = StateE.Connecticut
            self.name = "Connecticut"
        case "DE", "Delaware":
            self.nameE = StateE.Delaware
            self.name = "Delaware"
        case "FL", "Florida":
            self.nameE = StateE.Florida
            self.name = "Florida"
        case "GA", "Georgia":
            self.nameE = StateE.Georgia
            self.name = "Georgia"
        case "HI", "Hawaii":
            self.nameE = StateE.Hawaii
            self.name = "Hawaii"
        case "ID", "Idaho":
            self.nameE = StateE.Idaho
            self.name = "Idaho"
        case "IL", "Illinois":
            self.nameE = StateE.Illinois
            self.name = "Illinois"
        case "IN", "Indiana":
            self.nameE = StateE.Indiana
            self.name = "Indiana"
        case "IA", "Iowa":
            self.nameE = StateE.Iowa
            self.name = "Iowa"
        case "KS", "Kansas":
            self.nameE = StateE.Kansas
            self.name = "Kansas"
        case "KY", "Kentucky":
            self.nameE = StateE.Kentucky
            self.name = "Kentucky"
        case "LA", "Louisiana":
            self.nameE = StateE.Louisiana
            self.name = "Louisiana"
        case "ME", "Maine":
            self.nameE = StateE.Maine
            self.name = "Maine"
        case "MD", "Maryland":
            self.nameE = StateE.Maryland
            self.name = "Maryland"
        case "MA", "Massachusetts":
            self.nameE = StateE.Massachusetts
            self.name = "Massachusetts"
        case "MI", "Michigan":
            self.nameE = StateE.Michigan
            self.name = "Michigan"
        case "MN", "Minnesota":
            self.nameE = StateE.Minnesota
            self.name = "Minnesota"
        case "MS", "Mississippi":
            self.nameE = StateE.Mississippi
            self.name = "Mississippi"
        case "MO", "Missouri":
            self.nameE = StateE.Missouri
            self.name = "Missouri"
        case "MT", "Montana":
            self.nameE = StateE.Montana
            self.name = "Montana"
        case "NE", "Nebraska":
            self.nameE = StateE.Nebraska
            self.name = "Nebraska"
        case "NV", "Nevada":
            self.nameE = StateE.Nevada
            self.name = "Nevada"
        case "NH", "New Hampshire", "NewHampshire":
            self.nameE = StateE.NewHampshire
            self.name = "New Hampshire"
        case "NJ", "New Jersey", "NewJersey":
            self.nameE = StateE.NewJersey
            self.name = "New Jersey"
        case "NM", "New Mexico", "NewMexico":
            self.nameE = StateE.NewMexico
            self.name = "New Mexico"
        case "NY", "New York", "NewYork":
            self.nameE = StateE.NewYork
            self.name = "New York"
        case "NC", "North Carolina", "NorthCarolina":
            self.nameE = StateE.NorthCarolina
            self.name = "North Carolina"
        case "ND", "North Dakota", "NorthDakota":
            self.nameE = StateE.NorthDakota
            self.name = "North Dakota"
        case "OH", "Ohio":
            self.nameE = StateE.Ohio
            self.name = "Ohio"
        case "OK", "Oklahoma":
            self.nameE = StateE.Oklahoma
            self.name = "Oklahoma"
        case "OR", "Oregon":
            self.nameE = StateE.Oregon
            self.name = "Oregon"
        case "PA", "Pennsylvania":
            self.nameE = StateE.Pennsylvania
            self.name = "Pennsylvania"
        case "RI", "Rhode Island", "RhodeIsland":
            self.nameE = StateE.RhodeIsland
            self.name = "Rhode Island"
        case "SC", "South Carolina", "SouthCarolina":
            self.nameE = StateE.SouthCarolina
            self.name = "South Carolina"
        case "SD", "South Dakota", "SouthDakota":
            self.nameE = StateE.SouthDakota
            self.name = "South Dakota"
        case "TN", "Tennessee":
            self.nameE = StateE.Tennessee
            self.name = "Tennessee"
        case "TX", "Texas":
            self.nameE = StateE.Texas
            self.name = "Texas"
        case "UT", "Utah":
            self.nameE = StateE.Utah
            self.name = "Utah"
        case "VT", "Vermont":
            self.nameE = StateE.Vermont
            self.name = "Vermont"
        case "VA", "Virginia":
            self.nameE = StateE.Virginia
            self.name = "Virginia"
        case "WA", "Washington":
            self.nameE = StateE.Washington
            self.name = "Washington"
        case "WV", "West Virginia", "WestVirginia":
            self.nameE = StateE.WestVirginia
            self.name = "West Virginia"
        case "WI", "Wisconsin":
            self.nameE = StateE.Wisconsin
            self.name = "Wisconsin"
        case "WY", "Wyoming":
            self.nameE = StateE.Wyoming
            self.name = "Wyoming"
        case "":
            self.nameE = StateE.None
            self.name = ""
        default:
            print("No matching state in State.init")
            print(name)
            return nil
        }
    }
}

enum StateE {
    case Alabama
    case Alasaka
    case Arizona
    case Arkansas
    case California
    case Colorado
    case Connecticut
    case Delaware
    case Florida
    case Georgia
    case Hawaii
    case Idaho
    case Illinois
    case Indiana
    case Iowa
    case Kansas
    case Kentucky
    case Louisiana
    case Maine
    case Maryland
    case Massachusetts
    case Michigan
    case Minnesota
    case Mississippi
    case Missouri
    case Montana
    case Nebraska
    case Nevada
    case NewHampshire
    case NewJersey
    case NewMexico
    case NewYork
    case NorthCarolina
    case NorthDakota
    case Ohio
    case Oklahoma
    case Oregon
    case Pennsylvania
    case RhodeIsland
    case SouthCarolina
    case SouthDakota
    case Tennessee
    case Texas
    case Utah
    case Vermont
    case Virginia
    case Washington
    case WestVirginia
    case Wisconsin
    case Wyoming
    
    case None
}
