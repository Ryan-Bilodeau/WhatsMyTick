//
//  Tick.swift
//  TickIdentifierCurrent
//
//  Created by Ryan  Bilodeau on 7/18/18.
//  Copyright © 2018 Ryan Bilodeau. All rights reserved.
//

import Foundation
import UIKit

//Takes in abbreviation, returns tick model with all information
//struct Tick {
//    let abbreviation: String
//    let commonName: String
//    let scientificName: String
//    let image: UIImage?
//    let overview: String
//
//    let states: [State]
//
//    init?(abbreviation: String) {
//        self.abbreviation = abbreviation
//        switch abbreviation {
//        case "AmericanDog":
//            commonName = "American Dog Tick"
//            scientificName = "Dermacentor Variabilis"
////            image = #imageLiteral(resourceName: "AmericanDog2")
//            image = #imageLiteral(resourceName: "AmericanDogBoth")
//            overview = "The Dog Tick is widely distributed east of the Rocky Mountains and in limited areas on the Pacific coast. This tick is known to transmit Francisella tularensis (tularemia) and Rickettsia rickettsii (Rocky Mountain spotted fever). The adult females are most likely to bite humans. It is uncommon for it to transmit disease to people in the northeast. According to the CDC, RMSF is rarely seen in the Northeastern United States. Of 3,550 cases in the United States reported in 2014, only 1 to 2.3 cases per million persons were reported in the Northeast. Only one case of tularemia was reported in New Hampshire, five cases in Massachusetts, and five cases in New Jersey, in 2016. None were reported in the other northeast states that year. Other ticks can be responsible for spreading this disease. The tick prefers open areas, grassy fields and edges of woods such as walkways and trails. The American dog tick has a three host tick life cycle, Larvae, nymphs and adult. The larvae stage does not appear to transmit diseases. It should be noted that most of the ticks and diseases are expanding their range each year."
//
//            states = [State(name: "Alabama")!, State(name: "Arkansas")!, State(name: "California")!, State(name: "Connecticut")!, State(name: "Delaware")!, State(name: "Florida")!, State(name: "Georgia")!, State(name: "Illinois")!, State(name: "Indiana")!, State(name: "Iowa")!, State(name: "Kansas")!, State(name: "Kentucky")!, State(name: "Louisiana")!, State(name: "Maine")!, State(name: "Maryland")!, State(name: "Massachusetts")!, State(name: "Michigan")!, State(name: "Minnesota")!, State(name: "Mississippi")!, State(name: "Missouri")!, State(name: "Nebraska")!, State(name: "NewHampshire")!, State(name: "NewJersey")!, State(name: "NewYork")!, State(name: "NorthCarolina")!, State(name: "NorthDakota")!, State(name: "Ohio")!, State(name: "Oklahoma")!, State(name: "Pennsylvania")!, State(name: "RhodeIsland")!, State(name: "SouthCarolina")!, State(name: "SouthDakota")!, State(name: "Tennessee")!, State(name: "Texas")!, State(name: "Vermont")!, State(name: "Virginia")!, State(name: "WestVirginia")!]
//        case "Brown":
//            commonName = "Brown Dog Tick"
//            scientificName = "Rhipicephalus Sanguineus"
////            image = #imageLiteral(resourceName: "Brown2")
//            image = #imageLiteral(resourceName: "BrownBoth")
//            overview = " The Brown Dog Tick is widely distributed in North America, but it is uncommon for it to transmit disease to humans in the Northeast. It is known to transmit Rocky Mountain spotted fever but largely in the Southwest. According to the CDC, RMSF is rarely reported in the Northeast. Other ticks can also be responsible for spreading this disease. This tick prefers warm, shady areas as well as cracks and crevices. It is well known in kennels. The brown dog tick has a three host tick life cycle, larvae, nymph, and adult. The larvae stage does not appear to transmit diseases. This tick prefers dogs but will feed on other mammals. It should be noted that most of the ticks and diseases are expanding their range each year. "
//
//            states = [State(name: "Alabama")!, State(name: "Alaska")!, State(name: "Arizona")!, State(name: "Arkansas")!, State(name: "California")!, State(name: "Colorado")!, State(name: "Connecticut")!, State(name: "Delaware")!, State(name: "Florida")!, State(name: "Georgia")!, State(name: "Hawaii")!, State(name: "Idaho")!, State(name: "Illinois")!, State(name: "Indiana")!, State(name: "Iowa")!, State(name: "Kansas")!, State(name: "Kentucky")!, State(name: "Louisiana")!, State(name: "Maine")!, State(name: "Maryland")!, State(name: "Massachusetts")!, State(name: "Michigan")!, State(name: "Minnesota")!, State(name: "Mississippi")!, State(name: "Missouri")!, State(name: "Montana")!, State(name: "Nebraska")!, State(name: "Nevada")!, State(name: "NewHampshire")!, State(name: "NewJersey")!, State(name: "NewMexico")!, State(name: "NewYork")!, State(name: "NorthCarolina")!, State(name: "NorthDakota")!, State(name: "Ohio")!, State(name: "Oklahoma")!, State(name: "Oregon")!, State(name: "Pennsylvania")!, State(name: "RhodeIsland")!, State(name: "SouthCarolina")!, State(name: "SouthDakota")!, State(name: "Tennessee")!, State(name: "Texas")!, State(name: "Utah")!, State(name: "Vermont")!, State(name: "Virginia")!, State(name: "WestVirginia")!, State(name: "Washington")!, State(name: "Wisconsin")!, State(name: "Wyoming")!]
//        case "Deer":
//            commonName = "Deer Tick"
//            scientificName = "Ixodes Scapularis"
////            image = #imageLiteral(resourceName: "Deer1")
//            image = #imageLiteral(resourceName: "DeerBoth")
//            overview = "This is a widely distributed tick and is found though out the Northeast, Mid-Atlantic, Southeast, and Upper Midwestern of the United States. It is found all the way from Maine to Florida, west to Texas, and north to Minnesota. The deer tick is the tick to be most concerned about if found on a person. It is important to determine whether the tick is engorged or not. The nymph stage is quite small, only the size of a poppy seed making it hard to spot on one’s body. All life stages bite humans, but nymphs and adult females are most commonly found on people. The life cycle of the deer tick takes about two years to complete. All three stages require blood meals. The larvae stage only has six legs but all of the other stages have eight legs, typical of arachnids (spiders)."
//
//            states = [State(name: "Alabama")!, State(name: "Arkansas")!, State(name: "Connecticut")!, State(name: "Delaware")!, State(name: "Florida")!, State(name: "Georgia")!, State(name: "Illinois")!, State(name: "Indiana")!, State(name: "Kansas")!, State(name: "Kentucky")!, State(name: "Louisiana")!, State(name: "Maine")!, State(name: "Maryland")!, State(name: "Massachusetts")!, State(name: "Michigan")!, State(name: "Minnesota")!, State(name: "Mississippi")!, State(name: "Missouri")!, State(name: "NewHampshire")!, State(name: "NewJersey")!, State(name: "NewYork")!, State(name: "NorthCarolina")!, State(name: "Ohio")!, State(name: "Oklahoma")!, State(name: "Pennsylvania")!, State(name: "RhodeIsland")!, State(name: "SouthCarolina")!, State(name: "Tennessee")!, State(name: "Texas")!, State(name: "Vermont")!, State(name: "Virginia")!, State(name: "WestVirginia")!, State(name: "Wisconsin")!]
//        case "EuropeanWood":
//            commonName = "European Wood Tick"
//            scientificName = "Ixodes Ricinus"
////            image = #imageLiteral(resourceName: "EuropeanWood1")
//            image = #imageLiteral(resourceName: "EuropeanWoodBoth")
//            overview = "The European tick has only been identified in a few states on the east coast. At this time it is not thought to transmit diseases in the U.S. It is a significant player in European countries in the transmission of diseases. Its behavior is similar to the deer tick in the U.S. It has a high affinity for humans and quests for host from vegetation, as does the deer tick. Interestingly it has no eyes but has sensory organs called Hallers organs, which can detect changes in the environment such as temperature, carbon dioxide, humidity and vibrations. It should be noted that most of the ticks and diseases are expanding their range each year. "
//
//            states = [State(name: "Maryland")!, State(name: "NewJersey")!, State(name: "Virginia")!]
//        case "GulfCoast":
//            commonName = "Gulf Coast Tick"
//            scientificName = "Amblyomma Maculatum"
////            image = #imageLiteral(resourceName: "GulfCoast1")
//            image = #imageLiteral(resourceName: "GulfCoastBoth")
//            overview = "This tick has been linked to transmitting Rickettsia parkeri rickettsiosis known as part of \"Spotted Fever group Rickettsia\" (SFGR) to humans. It is primary located in Southeastern and Mid-Atlantic States from Southeast Texas east to Florida and north up to Maryland. Normally it inhabits grasslands and prairies along the shady edge of the woods. It should be noted that most of the ticks and diseases are expanding their range each year."
//
//            states = [State(name: "Alabama")!, State(name: "Arkansas")!, State(name: "Florida")!, State(name: "Georgia")!, State(name: "Louisiana")!, State(name: "Maryland")!, State(name: "Mississippi")!, State(name: "Missouri")!, State(name: "NorthCarolina")!, State(name: "Oklahoma")!, State(name: "SouthCarolina")!, State(name: "Texas")!, State(name: "Virginia")!, State(name: "WestVirginia")!]
//        case "LoneStar":
//            commonName = "Lone Star Tick"
//            scientificName = "Amblyomma Americanum"
////            image = #imageLiteral(resourceName: "LoneStar1")
//            image = #imageLiteral(resourceName: "LoneStarBoth")
//            overview = "This aggressive tick is widely distributed in the Northeastern region of the United States. Tularemia Disease and other diseases are known to be transmitted by this tick. According to the CDC, only one case of Tularemia was reported in New Hampshire, five cases in Massachusetts, and five cases in New Jersey in 2016. None were reported in the other Northeastern states that year. Ehrlichiosis Disease can be also transmitted by this tick and is found mostly in the Southeast and South, but is expanding into the Northeast with reported cases in each of the Northeastern states. The Southern Tick Associated Rash Illness, (STARI) is also now found in Northeast. Bourbon virus (Bourbon virus disease) and the Heartland Virus can be transmitted by this tick, but it is found primarily in the Midwest and south. This is a serious disease with no treatment currently available. As if those weren’t enough, an allergic reaction to eating red meat has been reported by some people bitten by the Lone Star Tick. The nymphs and female adults (has white spot on back) are most likely to feed on people."
//
//            states = [State(name: "Alabama")!, State(name: "Arkansas")!, State(name: "Connecticut")!, State(name: "Delaware")!, State(name: "Florida")!, State(name: "Georgia")!, State(name: "Illinois")!, State(name: "Indiana")!, State(name: "Iowa")!, State(name: "Kansas")!, State(name: "Kentucky")!, State(name: "Louisiana")!, State(name: "Maine")!, State(name: "Maryland")!, State(name: "Massachusetts")!, State(name: "Michigan")!, State(name: "Minnesota")!, State(name: "Mississippi")!, State(name: "Missouri")!, State(name: "NewHampshire")!, State(name: "NewJersey")!, State(name: "NewMexico")!, State(name: "NewYork")!, State(name: "NorthCarolina")!, State(name: "Ohio")!, State(name: "Oklahoma")!, State(name: "Pennsylvania")!, State(name: "RhodeIsland")!, State(name: "SouthCarolina")!, State(name: "Tennessee")!, State(name: "Texas")!, State(name: "Vermont")!, State(name: "Virginia")!, State(name: "WestVirginia")!]
//        case "WesternBlacklegged":
//            commonName = "Western Blacklegged Tick"
//            scientificName = "Ixodes Pacificus"
////            image = #imageLiteral(resourceName: "WesternBlacklegged2")
//            image = #imageLiteral(resourceName: "WesternBlackleggedBoth")
//            overview = "The Western deer tick is actually called the Western blacklegged tick. It is primarily located along the West Coast from Northern Oregon to Southern California and east to Arizona, Utah, and Nevada.  It has been known to transmit Anaplasmosis, Relapsing fever, and Lyme disease to people. Larvae and nymphs often feed on lizards, birds, and rodents. Adults more commonly feed on deer. Although all life stages bite humans, nymphs and adult females are more often reported on humans. This tick has a three host tick life cycle, larvae, nymph and adult. The larvae stage does not appear to transmit diseases. The life cycle of the deer tick takes about two years to complete. All three stages require blood meals. The larvae stage only has six legs but all of the other stages have eight legs, typical of arachnids (spiders). It should be noted that most of the ticks and diseases are expanding their range each year."
//
//            states = [State(name: "Arizona")!, State(name: "California")!, State(name: "Nevada")!, State(name: "Oregon")!, State(name: "Utah")!, State(name: "Washington")!]
//        case "Wood":
//            commonName = "Rocky Mountain Wood Tick"
//            scientificName = "Dermacentor Andersoni"
////            image = #imageLiteral(resourceName: "Wood1")
//            image = #imageLiteral(resourceName: "WoodBoth")
//            overview = "As the names suggests, this tick mostly located in the Rocky Mountain States in elevations above fourteen thousand feet. Wood ticks typically take two to three years to complete their life cycle. The adult tick is the primary vector for diseases to people such as RMSF, Colorado Tick Fever, and Tularemia. Rocky Mountain wood tick saliva contains a neurotoxin that can occasionally cause tick paralysis in humans and pets. A bite from an adult female can induce an ascending paralysis that should stop after just a few minutes after the tick being removed, however; may persist for up to a day or more. It is caused by a form of Tularemia. The CDC reports that this tick tansmits Rickettsia rickettsii (Rocky Mountain spotted fever), Colorado tick fever virus (Colorado tick fever), and Francisella tularensis (tularemia). It should be noted that most of the ticks and diseases are expanding their range each year. "
//
//            states = [State(name: "Arizona")!, State(name: "California")!, State(name: "Colorado")!, State(name: "Idaho")!, State(name: "Montana")!, State(name: "Nevada")!, State(name: "NewMexico")!, State(name: "Oregon")!, State(name: "Utah")!, State(name: "Washington")!, State(name: "Wyoming")!]
//        default:
//            print("No matching tick abbreviation in Tick.init")
//            return nil
//        }
//    }
//
//
//
//
//
//
//
//
//
//
//    init(abbreviation: String, commonName: String, scientificName: String, image: UIImage?, overview: String, states: [State]) {
//        self.abbreviation = abbreviation
//        self.commonName = commonName
//        self.scientificName = scientificName
//        self.image = image
//        self.overview = overview
//        self.states = states
//    }
//
//    static public func getMaleFemale(abbreviation: String) -> [Tick]? {
//        switch abbreviation {
//        case "AmericanDog":
//            let maleCommonName = "American Dog Tick (Male)"
//            let femaleCommonName = "American Dog Tick (Female)"
//            let maleImage = #imageLiteral(resourceName: "AmericanDog2")
//            let femaleImage = #imageLiteral(resourceName: "AmericanDog2")
//            let scientificName = "Dermacentor Variabilis"
//            let overview = "The Dog Tick is widely distributed east of the Rocky Mountains and in limited areas on the Pacific coast. This tick is known to transmit Francisella tularensis (tularemia) and Rickettsia rickettsii (Rocky Mountain spotted fever). The adult females are most likely to bite humans. It is uncommon for it to transmit disease to people in the northeast. According to the CDC, RMSF is rarely seen in the Northeastern United States. Of 3,550 cases in the United States reported in 2014, only 1 to 2.3 cases per million persons were reported in the Northeast. Only one case of tularemia was reported in New Hampshire, five cases in Massachusetts, and five cases in New Jersey, in 2016. None were reported in the other northeast states that year. Other ticks can be responsible for spreading this disease. The tick prefers open areas, grassy fields and edges of woods such as walkways and trails. The American dog tick has a three host tick life cycle, Larvae, nymphs and adult. The larvae stage does not appear to transmit diseases. It should be noted that most of the ticks and diseases are expanding their range each year."
//
//            let states = [State(name: "Alabama")!, State(name: "Arkansas")!, State(name: "California")!, State(name: "Connecticut")!, State(name: "Delaware")!, State(name: "Florida")!, State(name: "Georgia")!, State(name: "Illinois")!, State(name: "Indiana")!, State(name: "Iowa")!, State(name: "Kansas")!, State(name: "Kentucky")!, State(name: "Louisiana")!, State(name: "Maine")!, State(name: "Maryland")!, State(name: "Massachusetts")!, State(name: "Michigan")!, State(name: "Minnesota")!, State(name: "Mississippi")!, State(name: "Missouri")!, State(name: "Nebraska")!, State(name: "NewHampshire")!, State(name: "NewJersey")!, State(name: "NewYork")!, State(name: "NorthCarolina")!, State(name: "NorthDakota")!, State(name: "Ohio")!, State(name: "Oklahoma")!, State(name: "Pennsylvania")!, State(name: "RhodeIsland")!, State(name: "SouthCarolina")!, State(name: "SouthDakota")!, State(name: "Tennessee")!, State(name: "Texas")!, State(name: "Vermont")!, State(name: "Virginia")!, State(name: "WestVirginia")!]
//
//            return [Tick(abbreviation: abbreviation, commonName: maleCommonName, scientificName: scientificName, image: maleImage, overview: overview, states: states), Tick(abbreviation: abbreviation, commonName: femaleCommonName, scientificName: scientificName, image: femaleImage, overview: overview, states: states)]
//        case "Brown":
//            let maleCommonName = "Brown Dog Tick (Male)"
//            let femaleCommonName = "Brown Dog Tick (Female)"
//            let maleImage = #imageLiteral(resourceName: "Brown2")
//            let femaleImage = #imageLiteral(resourceName: "Brown2")
//            let scientificName = "Rhipicephalus Sanguineus"
//            let overview = " The Brown Dog Tick is widely distributed in North America, but it is uncommon for it to transmit disease to humans in the Northeast. It is known to transmit Rocky Mountain spotted fever but largely in the Southwest. According to the CDC, RMSF is rarely reported in the Northeast. Other ticks can also be responsible for spreading this disease. This tick prefers warm, shady areas as well as cracks and crevices. It is well known in kennels. The brown dog tick has a three host tick life cycle, larvae, nymph, and adult. The larvae stage does not appear to transmit diseases. This tick prefers dogs but will feed on other mammals. It should be noted that most of the ticks and diseases are expanding their range each year. "
//
//            let states = [State(name: "Alabama")!, State(name: "Alaska")!, State(name: "Arizona")!, State(name: "Arkansas")!, State(name: "California")!, State(name: "Colorado")!, State(name: "Connecticut")!, State(name: "Delaware")!, State(name: "Florida")!, State(name: "Georgia")!, State(name: "Hawaii")!, State(name: "Idaho")!, State(name: "Illinois")!, State(name: "Indiana")!, State(name: "Iowa")!, State(name: "Kansas")!, State(name: "Kentucky")!, State(name: "Louisiana")!, State(name: "Maine")!, State(name: "Maryland")!, State(name: "Massachusetts")!, State(name: "Michigan")!, State(name: "Minnesota")!, State(name: "Mississippi")!, State(name: "Missouri")!, State(name: "Montana")!, State(name: "Nebraska")!, State(name: "Nevada")!, State(name: "NewHampshire")!, State(name: "NewJersey")!, State(name: "NewMexico")!, State(name: "NewYork")!, State(name: "NorthCarolina")!, State(name: "NorthDakota")!, State(name: "Ohio")!, State(name: "Oklahoma")!, State(name: "Oregon")!, State(name: "Pennsylvania")!, State(name: "RhodeIsland")!, State(name: "SouthCarolina")!, State(name: "SouthDakota")!, State(name: "Tennessee")!, State(name: "Texas")!, State(name: "Utah")!, State(name: "Vermont")!, State(name: "Virginia")!, State(name: "WestVirginia")!, State(name: "Washington")!, State(name: "Wisconsin")!, State(name: "Wyoming")!]
//
//            return [Tick(abbreviation: abbreviation, commonName: maleCommonName, scientificName: scientificName, image: maleImage, overview: overview, states: states), Tick(abbreviation: abbreviation, commonName: femaleCommonName, scientificName: scientificName, image: femaleImage, overview: overview, states: states)]
//        case "Deer":
//            let maleCommonName = "Deer Tick (Male)"
//            let femaleCommonName = "Deer Tick (Female)"
//            let maleImage = #imageLiteral(resourceName: "Deer1")
//            let femaleImage = #imageLiteral(resourceName: "Deer2")
//            let scientificName = "Ixodes Scapularis"
//            let overview = "This is a widely distributed tick and is found though out the Northeast, Mid-Atlantic, Southeast, and Upper Midwestern of the United States. It is found all the way from Maine to Florida, west to Texas, and north to Minnesota. The deer tick is the tick to be most concerned about if found on a person. It is important to determine whether the tick is engorged or not. The nymph stage is quite small, only the size of a poppy seed making it hard to spot on one’s body. All life stages bite humans, but nymphs and adult females are most commonly found on people. The life cycle of the deer tick takes about two years to complete. All three stages require blood meals. The larvae stage only has six legs but all of the other stages have eight legs, typical of arachnids (spiders)."
//
//            let states = [State(name: "Alabama")!, State(name: "Arkansas")!, State(name: "Connecticut")!, State(name: "Delaware")!, State(name: "Florida")!, State(name: "Georgia")!, State(name: "Illinois")!, State(name: "Indiana")!, State(name: "Kansas")!, State(name: "Kentucky")!, State(name: "Louisiana")!, State(name: "Maine")!, State(name: "Maryland")!, State(name: "Massachusetts")!, State(name: "Michigan")!, State(name: "Minnesota")!, State(name: "Mississippi")!, State(name: "Missouri")!, State(name: "NewHampshire")!, State(name: "NewJersey")!, State(name: "NewYork")!, State(name: "NorthCarolina")!, State(name: "Ohio")!, State(name: "Oklahoma")!, State(name: "Pennsylvania")!, State(name: "RhodeIsland")!, State(name: "SouthCarolina")!, State(name: "Tennessee")!, State(name: "Texas")!, State(name: "Vermont")!, State(name: "Virginia")!, State(name: "WestVirginia")!, State(name: "Wisconsin")!]
//
//            return [Tick(abbreviation: abbreviation, commonName: maleCommonName, scientificName: scientificName, image: maleImage, overview: overview, states: states), Tick(abbreviation: abbreviation, commonName: femaleCommonName, scientificName: scientificName, image: femaleImage, overview: overview, states: states)]
//        case "EuropeanWood":
//            let maleCommonName = "European Wood Tick (Male)"
//            let femaleCommonName = "European Wood Tick (Female)"
//            let maleImage = #imageLiteral(resourceName: "EuropeanWood1")
//            let femaleImage = #imageLiteral(resourceName: "EuropeanWood1")
//            let scientificName = "Ixodes Ricinus"
//            let overview = "The European tick has only been identified in a few states on the east coast. At this time it is not thought to transmit diseases in the U.S. It is a significant player in European countries in the transmission of diseases. Its behavior is similar to the deer tick in the U.S. It has a high affinity for humans and quests for host from vegetation, as does the deer tick. Interestingly it has no eyes but has sensory organs called Hallers organs, which can detect changes in the environment such as temperature, carbon dioxide, humidity and vibrations. It should be noted that most of the ticks and diseases are expanding their range each year."
//
//            let states = [State(name: "Maryland")!, State(name: "NewJersey")!, State(name: "Virginia")!]
//
//            return [Tick(abbreviation: abbreviation, commonName: maleCommonName, scientificName: scientificName, image: maleImage, overview: overview, states: states), Tick(abbreviation: abbreviation, commonName: femaleCommonName, scientificName: scientificName, image: femaleImage, overview: overview, states: states)]
//        case "GulfCoast":
//            let maleCommonName = "Gulf Coast Tick (Male)"
//            let femaleCommonName = "Gulf Coast Tick (Female)"
//            let maleImage = #imageLiteral(resourceName: "GulfCoast1")
//            let femaleImage = #imageLiteral(resourceName: "GulfCoast1")
//            let scientificName = "Amblyomma Maculatum"
//            let overview = "This tick has been linked to transmitting Rickettsia parkeri rickettsiosis known as part of \"Spotted Fever group Rickettsia\" (SFGR) to humans. It is primary located in Southeastern and Mid-Atlantic States from Southeast Texas east to Florida and north up to Maryland. Normally it inhabits grasslands and prairies along the shady edge of the woods. It should be noted that most of the ticks and diseases are expanding their range each year."
//
//            let states = [State(name: "Alabama")!, State(name: "Arkansas")!, State(name: "Florida")!, State(name: "Georgia")!, State(name: "Louisiana")!, State(name: "Maryland")!, State(name: "Mississippi")!, State(name: "Missouri")!, State(name: "NorthCarolina")!, State(name: "Oklahoma")!, State(name: "SouthCarolina")!, State(name: "Texas")!, State(name: "Virginia")!, State(name: "WestVirginia")!]
//
//            return [Tick(abbreviation: abbreviation, commonName: maleCommonName, scientificName: scientificName, image: maleImage, overview: overview, states: states), Tick(abbreviation: abbreviation, commonName: femaleCommonName, scientificName: scientificName, image: femaleImage, overview: overview, states: states)]
//        case "LoneStar":
//            let maleCommonName = "Lone Star Tick (Male)"
//            let femaleCommonName = "Lone Star Tick (Female)"
//            let maleImage = #imageLiteral(resourceName: "LoneStar1")
//            let femaleImage = #imageLiteral(resourceName: "LoneStar1")
//            let scientificName = "Amblyomma Americanum"
//            let overview = "This aggressive tick is widely distributed in the Northeastern region of the United States. Tularemia Disease and other diseases are known to be transmitted by this tick. According to the CDC, only one case of Tularemia was reported in New Hampshire, five cases in Massachusetts, and five cases in New Jersey in 2016. None were reported in the other Northeastern states that year. Ehrlichiosis Disease can be also transmitted by this tick and is found mostly in the Southeast and South, but is expanding into the Northeast with reported cases in each of the Northeastern states. The Southern Tick Associated Rash Illness, (STARI) is also now found in Northeast. Bourbon virus (Bourbon virus disease) and the Heartland Virus can be transmitted by this tick, but it is found primarily in the Midwest and south. This is a serious disease with no treatment currently available. As if those weren’t enough, an allergic reaction to eating red meat has been reported by some people bitten by the Lone Star Tick. The nymphs and female adults (has white spot on back) are most likely to feed on people."
//
//            let states = [State(name: "Alabama")!, State(name: "Arkansas")!, State(name: "Connecticut")!, State(name: "Delaware")!, State(name: "Florida")!, State(name: "Georgia")!, State(name: "Illinois")!, State(name: "Indiana")!, State(name: "Iowa")!, State(name: "Kansas")!, State(name: "Kentucky")!, State(name: "Louisiana")!, State(name: "Maine")!, State(name: "Maryland")!, State(name: "Massachusetts")!, State(name: "Michigan")!, State(name: "Minnesota")!, State(name: "Mississippi")!, State(name: "Missouri")!, State(name: "NewHampshire")!, State(name: "NewJersey")!, State(name: "NewMexico")!, State(name: "NewYork")!, State(name: "NorthCarolina")!, State(name: "Ohio")!, State(name: "Oklahoma")!, State(name: "Pennsylvania")!, State(name: "RhodeIsland")!, State(name: "SouthCarolina")!, State(name: "Tennessee")!, State(name: "Texas")!, State(name: "Vermont")!, State(name: "Virginia")!, State(name: "WestVirginia")!]
//
//            return [Tick(abbreviation: abbreviation, commonName: maleCommonName, scientificName: scientificName, image: maleImage, overview: overview, states: states), Tick(abbreviation: abbreviation, commonName: femaleCommonName, scientificName: scientificName, image: femaleImage, overview: overview, states: states)]
//        case "WesternBlacklegged":
//            let maleCommonName = "Western Blacklegged Tick (Male)"
//            let femaleCommonName = "Western Blacklegged Tick (Female)"
//            let maleImage = #imageLiteral(resourceName: "WesternBlacklegged2")
//            let femaleImage = #imageLiteral(resourceName: "WesternBlacklegged2")
//            let scientificName = "Ixodes Pacificus"
//            let overview = "The Western deer tick is actually called the Western blacklegged tick. It is primarily located along the West Coast from Northern Oregon to Southern California and east to Arizona, Utah, and Nevada.  It has been known to transmit Anaplasmosis, Relapsing fever, and Lyme disease to people. Larvae and nymphs often feed on lizards, birds, and rodents. Adults more commonly feed on deer. Although all life stages bite humans, nymphs and adult females are more often reported on humans. This tick has a three host tick life cycle, larvae, nymph and adult. The larvae stage does not appear to transmit diseases. The life cycle of the deer tick takes about two years to complete. All three stages require blood meals. The larvae stage only has six legs but all of the other stages have eight legs, typical of arachnids (spiders). It should be noted that most of the ticks and diseases are expanding their range each year."
//
//            let states = [State(name: "Arizona")!, State(name: "California")!, State(name: "Nevada")!, State(name: "Oregon")!, State(name: "Utah")!, State(name: "Washington")!]
//
//            return [Tick(abbreviation: abbreviation, commonName: maleCommonName, scientificName: scientificName, image: maleImage, overview: overview, states: states), Tick(abbreviation: abbreviation, commonName: femaleCommonName, scientificName: scientificName, image: femaleImage, overview: overview, states: states)]
//        case "Wood":
//            let maleCommonName = "Rocky Mountain Wood Tick (Male)"
//            let femaleCommonName = "Rocky Mountain Wood Tick (Female)"
//            let scientificName = "Dermacentor Andersoni"
//            let maleImage = #imageLiteral(resourceName: "Wood1")
//            let femaleImage = #imageLiteral(resourceName: "Wood1")
//            let overview = "As the names suggests, this tick mostly located in the Rocky Mountain States in elevations above fourteen thousand feet. Wood ticks typically take two to three years to complete their life cycle. The adult tick is the primary vector for diseases to people such as RMSF, Colorado Tick Fever, and Tularemia. Rocky Mountain wood tick saliva contains a neurotoxin that can occasionally cause tick paralysis in humans and pets. A bite from an adult female can induce an ascending paralysis that should stop after just a few minutes after the tick being removed, however; may persist for up to a day or more. It is caused by a form of Tularemia. The CDC reports that this tick tansmits Rickettsia rickettsii (Rocky Mountain spotted fever), Colorado tick fever virus (Colorado tick fever), and Francisella tularensis (tularemia). It should be noted that most of the ticks and diseases are expanding their range each year. "
//
//            let states = [State(name: "Arizona")!, State(name: "California")!, State(name: "Colorado")!, State(name: "Idaho")!, State(name: "Montana")!, State(name: "Nevada")!, State(name: "NewMexico")!, State(name: "Oregon")!, State(name: "Utah")!, State(name: "Washington")!, State(name: "Wyoming")!]
//
//            return [Tick(abbreviation: abbreviation, commonName: maleCommonName, scientificName: scientificName, image: maleImage, overview: overview, states: states), Tick(abbreviation: abbreviation, commonName: femaleCommonName, scientificName: scientificName, image: femaleImage, overview: overview, states: states)]
//        default:
//            print("No matching tick abbreviation in Tick.getMaleFemale")
//            return nil
//        }
//    }
//}


//struct TestTick {
//    let abbreviation: String
//    let rank: Int
//    let commonName: String
//    let scientificName: String
//    let diseases: String
//    let medicalInfo: String
//    let statesFoundIn: [State]
//    let image: UIImage?
//
//    init?(abbreviation: String, rank: Int) {
//        self.abbreviation = abbreviation
//        self.rank = rank
//        switch abbreviation {
//        case "AmericanDog":
//            commonName = "American Dog Tick"
//            scientificName = "Dermacentor variabilis"
//            diseases = ""
//            medicalInfo = ""
//            statesFoundIn = [State(name: "ME")!]
//            image = #imageLiteral(resourceName: "AmericanDog2")
//        case "Brown":
//            commonName = "Brown Dog Tick"
//            scientificName = "Rhipicephalus sanguineus"
//            diseases = ""
//            medicalInfo = ""
//            statesFoundIn = [State(name: "ME")!]
//            image = #imageLiteral(resourceName: "Brown2")
//        case "Deer":
//            commonName = "Deer Tick"
//            scientificName = "Ixodes scapularis"
//            diseases = ""
//            medicalInfo = ""
//            statesFoundIn = [State(name: "ME")!]
//            image = #imageLiteral(resourceName: "Deer1")
//        case "EuropeanWood":
//            commonName = "European Wood Tick"
//            scientificName = "Ixodes ricinus"
//            diseases = ""
//            medicalInfo = ""
//            statesFoundIn = [State(name: "ME")!]
//            image = #imageLiteral(resourceName: "EuropeanWood1")
//        case "GulfCoast":
//            commonName = "Gulf Coast Tick"
//            scientificName = "Amblyomma maculatum"
//            diseases = ""
//            medicalInfo = ""
//            statesFoundIn = [State(name: "ME")!]
//            image = #imageLiteral(resourceName: "GulfCoast1")
//        case "LoneStar":
//            commonName = "Lone Star Tick"
//            scientificName = "Amblyomma americanum"
//            diseases = ""
//            medicalInfo = ""
//            statesFoundIn = [State(name: "ME")!]
//            image = #imageLiteral(resourceName: "LoneStar1")
//        case "WesternBlacklegged":
//            commonName = "Western Blacklegged Tick"
//            scientificName = "Ixodes pacificus"
//            diseases = ""
//            medicalInfo = ""
//            statesFoundIn = [State(name: "ME")!]
//            image = #imageLiteral(resourceName: "WesternBlacklegged2")
//        case "Wood":
//            commonName = "Rocky Mountain Wood Tick"
//            scientificName = "Dermacentor andersoni"
//            diseases = ""
//            medicalInfo = ""
//            statesFoundIn = [State(name: "ME")!]
//            image = #imageLiteral(resourceName: "Wood1")
//        default:
//            print("No matching tick abbreviation in Tick.init")
//            return nil
//        }
//    }
//}
