//
//  LocationServices.swift
//  TickIdentifierCurrent
//
//  Created by Ryan  Bilodeau on 7/26/18.
//  Copyright © 2018 Ryan Bilodeau. All rights reserved.
//

import Foundation
import MapKit

typealias JSONDictionary = [String:Any]

class LocationServices {
    
    static let shared = LocationServices()
    let locManager = CLLocationManager()
    var currentLocation: CLLocation!
    
    let inUse = CLAuthorizationStatus.authorizedWhenInUse
    let always = CLAuthorizationStatus.authorizedAlways
    
//    func getAdress(completion: @escaping (_ address: JSONDictionary?, _ error: Error?) -> ()) {
//        self.locManager.requestWhenInUseAuthorization()
//
//        if self.authStatus == inUse || self.authStatus == always {
//
//            self.currentLocation = locManager.location
//
//            let geoCoder = CLGeocoder()
//
//            geoCoder.reverseGeocodeLocation(self.currentLocation) { placemarks, error in
//
//                if let e = error {
//
//                    completion(nil, e)
//
//                } else {
//
//                    let placeArray = placemarks as? [CLPlacemark]
//
//                    var placeMark: CLPlacemark!
//
//                    placeMark = placeArray?[0]
//                    print(placeMark.administrativeArea, "Administrative area")
//                    guard let address = placeMark.addressDictionary as? JSONDictionary else {
//                        return
//                    }
//
//                    completion(address, nil)
//
//                }
//
//            }
//        } else {
//            print("Couldn't access user location")
//        }
//    }
//    func getState(completion: @escaping (_ state: String?, _ error: Error?) -> ()) {
//
//        self.locManager.requestWhenInUseAuthorization()
//
//        if CLLocationManager.authorizationStatus() == .authorizedAlways || CLLocationManager.authorizationStatus() == .authorizedWhenInUse {
//
//            self.currentLocation = locManager.location
//
//            let geoCoder = CLGeocoder()
//
//            geoCoder.reverseGeocodeLocation(self.currentLocation) { placemarks, error in
//                if let e = error {
//
//                    completion(nil, e)
//
//                } else {
//
//                    let placeArray = placemarks as? [CLPlacemark]
//
//                    var placeMark: CLPlacemark!
//
//                    placeMark = placeArray?[0]
//
//                    completion(placeMark.administrativeArea, nil)
//                }
//            }
//        } else {
//            print("Couldn't access user location")
//            completion(nil, nil)
//        }
//    }
}
