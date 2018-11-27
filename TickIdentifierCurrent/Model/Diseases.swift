//
//  Disease.swift
//  TickIdentifierCurrent
//
//  Created by Ryan  Bilodeau on 8/13/18.
//  Copyright © 2018 Ryan Bilodeau. All rights reserved.
//

import Foundation

class Diseases {
    var diseases: [Disease] = [Disease]()
    
    init?(tick: Tick, state: String) {
        let stateE = State(name: state)!.nameE
        
        switch tick.abbreviation {
        case "AmericanDog", "AmericanDogM", "AmericanDogF":
            diseases.append(Disease(diseaseE: .FrancisellaTularensis, state: stateE))
            diseases.append(Disease(diseaseE: .RickettsiaRickettsiiFever, state: stateE))
            diseases.append(Disease(diseaseE: .Rickettsiosis364D, state: stateE))
        case "Brown", "BrownM", "BrownF":
            diseases.append(Disease(diseaseE: .FrancisellaTularensis, state: stateE))
            diseases.append(Disease(diseaseE: .RickettsiaRickettsiiFever, state: stateE))
        case "Deer", "DeerM", "DeerF":
            diseases.append(Disease(diseaseE: .AnaplasmaDisease, state: stateE))
            diseases.append(Disease(diseaseE: .BabesiosisDisease, state: stateE))
            diseases.append(Disease(diseaseE: .BorreliaMayoniiInfection, state: stateE))
            diseases.append(Disease(diseaseE: .BorreliaMiyamotoiInfection, state: stateE))
            diseases.append(Disease(diseaseE: .Ehrlichiosis, state: stateE))
            diseases.append(Disease(diseaseE: .LymeDisease, state: stateE))
            diseases.append(Disease(diseaseE: .PowassanVirusDisease, state: stateE))
        case "EuropeanWood", "EuropeanWoodM", "EuropeanWoodF":
            print("")
        case "GulfCoast", "GulfCoastM", "GulfCoastF":
            diseases.append(Disease(diseaseE: .RickettsiaRickettsiiFever, state: stateE))
        case "LoneStar", "LoneStarM", "LoneStarF":
            diseases.append(Disease(diseaseE: .Ehrlichiosis, state: stateE))
            diseases.append(Disease(diseaseE: .HeartlandVirus, state: stateE))
            diseases.append(Disease(diseaseE: .FrancisellaTularensis, state: stateE))
        case "WesternBlacklegged", "WesternBlackleggedM", "WesternBlackleggedF":
            diseases.append(Disease(diseaseE: .AnaplasmaDisease, state: stateE))
            diseases.append(Disease(diseaseE: .BorreliaMiyamotoiInfection, state: stateE))
            diseases.append(Disease(diseaseE: .LymeDisease, state: stateE))
            diseases.append(Disease(diseaseE: .TBRF, state: stateE))
        case "Wood", "WoodM", "WoodF":
            diseases.append(Disease(diseaseE: .ColoradoTickFever, state: stateE))
            diseases.append(Disease(diseaseE: .FrancisellaTularensis, state: stateE))
            diseases.append(Disease(diseaseE: .RickettsiaRickettsiiFever, state: stateE))
        default:
            print("No matching tick abbreviation in Diseases.init")
            return nil
        }
    }
}
class Disease {
    let commonName: String
    let diseaseE: DiseaseE
    let severityE: SeverityE
    
    init(diseaseE: DiseaseE, state: StateE) {
        self.diseaseE = diseaseE
        
        switch diseaseE {
        case .AnaplasmaDisease:
            self.commonName = "Anaplasma Disease"
            
            let lowSeverityStates: [StateE] = [.Arkansas, .Delaware, .Florida, .Illinois, .Iowa, .Kansas, .Kentucky, .Maryland, .Massachusetts, .Michigan, .Missouri, .Montana, .Nebraska, .Nevada, .NewJersey, .NorthCarolina, .NorthDakota, .Ohio, .Oklahoma,.Oregon , .SouthDakota, .Tennessee, .Texas, .Utah, .Vermont, .Virginia, .Washington, .Wyoming]
            
            if lowSeverityStates.contains(state) {
                self.severityE = .Low
            } else {
                self.severityE = .Medium
            }
        case .BabesiosisDisease:
            self.commonName = "Babesiosis Disease"
            
            let lowSeverityStates: [StateE] = [.Minnesota, .Wisconsin]
            
            if lowSeverityStates.contains(state) {
                self.severityE = .Low
            } else {
                self.severityE = .Medium
            }
        case .BorreliaMayoniiInfection:
            self.commonName = "Borrelia Mayonii Infection"
            
            let lowSeverityStates: [StateE] = [.Minnesota, .Wisconsin]
            
            if lowSeverityStates.contains(state) {
                self.severityE = .Low
            } else {
                self.severityE = .Low
            }
        case .BorreliaMiyamotoiInfection:
            self.commonName = "Borrelia Miyamotoi Infection"
            
            let highSeverityStates: [StateE] = [.Connecticut, .Delaware, .Maine, .Maryland, .Massachusetts, .Minnesota, .NewHampshire, .NewJersey, .NewYork, .Pennsylvania, .RhodeIsland, .Vermont, .Virginia, .Wisconsin]
            let mediumSeverityStates: [StateE] = [.California, .Florida, .Ohio]
            
            if highSeverityStates.contains(state) {
                self.severityE = .High
            } else if mediumSeverityStates.contains(state) {
                self.severityE = .Medium
            } else {
                self.severityE = .Low
            }
//        case .BourbonVirusInfection:
//            self.commonName = "Bourbon Virus Infection"
        case .ColoradoTickFever:
            self.commonName = "Colorado Tick Fever"
            
            let mediumSeverityStates: [StateE] = [.Arizona, .California, .Colorado, .Idaho, .Montana, .Nevada, .NewMexico, .Oregon, .Utah, .Washington, .Wyoming]
            
            if mediumSeverityStates.contains(state) {
                self.severityE = .Medium
            } else {
                self.severityE = .Low
            }
        case .Ehrlichiosis:
            self.commonName = "Ehrlichiosis Illness"
            
            let meidumSeverityStates: [StateE] = [.Arkansas, .Delaware, .Kansas, .Kentucky, .Maryland, .Missouri, .NewJersey, .NewYork, .Oklahoma, .RhodeIsland, .Tennessee, .Virginia]
            
            if meidumSeverityStates.contains(state) {
                self.severityE = .Medium
            } else {
                self.severityE = .Low
            }
        case .HeartlandVirus:
            self.commonName = "Heartland Virus"
            
            let mediumSeverityStates: [StateE] = [.Arkansas, .Georgia, .Indiana, .Kansas, .Kentucky, .Missouri, .NorthCarolina, .Oklahoma, .Tennessee]
            
            if mediumSeverityStates.contains(state) {
                self.severityE = .Medium
            } else {
                self.severityE = .Low
            }
        case .FrancisellaTularensis:
            self.commonName = "Francisella Tularensis (Rabbit Fever)"
            
            let mediumSeverityStates: [StateE] = [.Colorado, .Massachusetts, .NewMexico]
            
            if mediumSeverityStates.contains(state) {
                self.severityE = .Medium
            } else {
                self.severityE = .Low
            }
        case .LymeDisease:
            self.commonName = "Lyme Disease"
            
            let highSeverityStates: [StateE] = [.Connecticut, .Delaware, .Maine, .Maryland, .Massachusetts, .Minnesota, .NewHampshire, .NewJersey, .NewYork, .Pennsylvania, .RhodeIsland, .Vermont, .Virginia, .Wisconsin]
            let mediumSeverityStates: [StateE] = [.California, .Florida, .Ohio]
            
            if highSeverityStates.contains(state) {
                self.severityE = .High
            } else if mediumSeverityStates.contains(state) {
                self.severityE = .Medium
            } else {
                self.severityE = .Low
            }
        case .RickettsiaRickettsiiFever:
            self.commonName = "Rickettsia Rickettsii (Rocky Mountain Spotted Fever)"
            
            let highSeverityStates: [StateE] = [.Arkansas, .Missouri, .NorthCarolina, .Oklahoma, .Tennessee]
            let mediumSeverityStates: [StateE] = [.Alabama, .Delaware, .Illinois, .Kansas, .Kentucky, .Mississippi, .Nebraska, .SouthCarolina, .Virginia]
            
            if highSeverityStates.contains(state) {
                self.severityE = .High
            } else if mediumSeverityStates.contains(state) {
                self.severityE = .Medium
            } else {
                self.severityE = .Low
            }
        case .PowassanVirusDisease:
            self.commonName = "Powassan Virus"
            
            let mediumSeverityStates: [StateE] = [.Minnesota, .Wisconsin, .NewYork, .Massachusetts]
            
            if mediumSeverityStates.contains(state) {
                self.severityE = .Medium
            } else {
                self.severityE = .Low
            }
        case .STARI:
            self.commonName = "STARI (Southern Tick-Associated Rash Illness)"
            
            let mediumSeverityStates: [StateE] = [.Alabama, .Arkansas, .Connecticut, .Delaware, .Florida, .Georgia, .Illinois, .Indiana, .Iowa, .Kansas, .Kentucky, .Louisiana, .Maine, .Maryland, .Massachusetts, .Michigan, .Minnesota, .Mississippi, .Missouri, .NewHampshire, .NewJersey, .NewMexico, .NewYork, .NorthCarolina, .Ohio, .Oklahoma, .Pennsylvania, .RhodeIsland, .SouthCarolina, .Tennessee, .Texas, .Vermont, .Virginia, .WestVirginia]
            
            if mediumSeverityStates.contains(state) {
                self.severityE = .Medium
            } else {
                self.severityE = .Low
            }
        case .TBRF:
            self.commonName = "TBRF (Tick-Borne Relapsing Fever)"
            
            let lowSeverityStates: [StateE] = [.Arizona, .California, .Colorado, .Idaho, .Kansas, .Montana, .Nevada, .NewMexico, .Ohio, .Oklahoma, .Oregon, .Texas, .Utah, .Washington, .Wyoming]
            
            if lowSeverityStates.contains(state) {
                self.severityE = .Low
            } else {
                self.severityE = .Low
            }
        case .Rickettsiosis364D:
            self.commonName = "364D Rickettsiosis"
            
            let lowSeverityStates: [StateE] = [.California]
            
            if lowSeverityStates.contains(state) {
                self.severityE = .Low
            } else {
                self.severityE = .Low
            }
        }
    }
}

enum DiseaseE {
    case AnaplasmaDisease
    case BabesiosisDisease
    case BorreliaMayoniiInfection
    case BorreliaMiyamotoiInfection
//    case BourbonVirusInfection
    case ColoradoTickFever
    case Ehrlichiosis
    case HeartlandVirus
    case FrancisellaTularensis
    case LymeDisease
    case RickettsiaRickettsiiFever
    case PowassanVirusDisease
    case STARI
    case TBRF
    case Rickettsiosis364D
}

enum SeverityE: String {
    case High = "High"
    case Medium = "Moderate"
    case Low = "Low"
}













