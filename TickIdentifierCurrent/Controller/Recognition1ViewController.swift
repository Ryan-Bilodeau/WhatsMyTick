//
//  Recognition1ViewController.swift
//  TickIdentifierCurrent
//
//  Created by Ryan  Bilodeau on 7/18/18.
//  Copyright © 2018 Ryan Bilodeau. All rights reserved.
//

import UIKit
import AVKit
import Vision
import CoreLocation

class Recognition1ViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate, CLLocationManagerDelegate {
    let locationManager = CLLocationManager()
    
    
    //Only set when user selects image, selecting an image starts analyzing process
    var selectedImage: UIImage! {
        didSet {
            onAnalyzingStart()
        }
    }
    
    var ticks: [Tick] = [Tick]()
    var userState: State?
    
    @IBOutlet weak var coverUIView: UIView!
    @IBOutlet weak var activityUIActivityIndicator: UIActivityIndicatorView!
    
    @IBAction func selectPhotoButtonClicked() {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            let imagePickerController = UIImagePickerController()
            imagePickerController.delegate = self
            imagePickerController.sourceType = .photoLibrary;
            imagePickerController.allowsEditing = true
            present(imagePickerController, animated: true, completion: nil)
            
            if userState == nil {
                locationManager.stopUpdatingLocation()
                locationManager.startUpdatingLocation()
            }
        }
    }
    @IBAction func takePhotoButtonClicked() {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let imagePickerController = UIImagePickerController()
            imagePickerController.delegate = self
            imagePickerController.sourceType = .camera
            imagePickerController.allowsEditing = false
            present(imagePickerController, animated: true, completion: nil)
            
            if userState == nil {
                locationManager.stopUpdatingLocation()
                locationManager.startUpdatingLocation()
            }
        }
    }
}

//Overridden stuff and delegates
extension Recognition1ViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if userState == nil {
            locationManager.requestAlwaysAuthorization()
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
            locationManager.startUpdatingLocation()
        }
        
        coverUIView.isHidden = true
        activityUIActivityIndicator.hidesWhenStopped = true
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        super.prepare(for: segue, sender: sender)
        
        guard segue.identifier == "goToRecognition2" else { return }
        
        if let destinationVC = segue.destination as? Recognition2ViewController {
            destinationVC.ticks = ticks
            destinationVC.userImage = selectedImage
            destinationVC.userState = userState
            
            //Set user image to photo tab image
            if let photoViewController = self.tabBarController?.viewControllers![2] as? PhotoViewController {
                photoViewController.userImage = self.selectedImage
            }
        }
    }
    //Called after taking a photo
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        // Local variable inserted by Swift 4.2 migrator.
        let info = convertFromUIImagePickerControllerInfoKeyDictionary(info)

        let image = info[convertFromUIImagePickerControllerInfoKey(UIImagePickerController.InfoKey.originalImage)] as! UIImage
        selectedImage = image
        
        if picker.sourceType == .camera {
            UIImageWriteToSavedPhotosAlbum(image, self, #selector(image(_:didFinishSavingWithError:contextInfo:)), nil)
        }
        
        picker.dismiss(animated: true, completion: nil)
    }
    //Called when saving a photo taken by the camera, only used to indicate an error
    @objc func image(_ image: UIImage, didFinishSavingWithError error: Error?, contextInfo: UnsafeRawPointer) {
        if error != nil {
            // we got back an error
            print("Error saving photo")
        } else {
            print("Photo saved successfully")
        }
    }
    //Called when the locationManager updates the user's location
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        print("Location updated")
        manager.stopUpdatingLocation()
        if let loc = locations.first {
            CLGeocoder().reverseGeocodeLocation(loc) { placemark, error in
                if let p = placemark?.first?.administrativeArea {
                    self.userState = State(name: p)
                    print("Administrative area is \(p)")
                }
            }
        }
    }
}

//Private functions
extension Recognition1ViewController {
    //Start analyzing the image...
    func onAnalyzingStart() {
        guard let ciImage = CIImage(image: selectedImage) else {
            fatalError("Can't convert UIImage to CIImage")
        }
        
        self.coverUIView.isHidden = false
        self.activityUIActivityIndicator.startAnimating()
        
        detectTicks(image: ciImage) { ticks in
            //Mimic photo analysis taking place since it happens too quickly
            DispatchQueue.main.asyncAfter(deadline: .now() + drand48() + 1.5) {
                //Get user's current state
                if self.userState == nil {
                    let alert = UIAlertController(title: "Location Failed", message: "Couldn't get your location. Will proceed without location services.", preferredStyle: UIAlertController.Style.alert)
                    alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (action) in
                        self.callInOnAnalyzingStart(ticks: ticks)
                        alert.dismiss(animated: true, completion: nil)
                    }))
                    self.present(alert, animated: true, completion: nil )
                } else {
                    self.callInOnAnalyzingStart(ticks: ticks)
                }
            }
        }
    }
    //Detect top ticks, access them through closure
    func detectTicks(image: CIImage, completion: @escaping (([Tick]) -> Void)) {
        let detectionThreshold: Float = 0.0
        
        guard let model = try? VNCoreMLModel(for: tickModel().model) else {
            fatalError("Can't load ML model")
        }
        let request = VNCoreMLRequest(model: model) { request, error in
            guard var results = request.results as? [VNClassificationObservation] else {
                fatalError("Unexpected result type from VNCoreMLRequest")
            }
            
            results.sort { return $0.confidence > $1.confidence }
            
            var t = [Tick]()
            
            for res in results {
                if res.confidence > detectionThreshold {
                    t.append(Tick.getTick(abbreviation: "\(res.identifier)M")!)
                    t.append(Tick.getTick(abbreviation: "\(res.identifier)F")!)
                }
            }
            
            completion(t)
        }
        //Execute CNN request
        let handler = VNImageRequestHandler(ciImage: image)
        DispatchQueue.global(qos: .userInteractive).async {
            do {
                try handler.perform([request])
            } catch {
                fatalError("Request execution failed")
            }
        }
    }
    private func callInOnAnalyzingStart(ticks: [Tick]) {
        if ticks.count > 0 {
            self.ticks = ticks
            
            if self.userState != nil {
                //Narrow down ticks based on state
                for t in self.ticks {
                    if !t.states.contains(where: { (s) -> Bool in return s.nameE == self.userState!.nameE }) {
                        self.ticks.remove(at: self.ticks.index(where: { (x) -> Bool in return x.commonName == t.commonName })! )
                    }
                }
            }
        }
        
        //Ticks may have been modified above
        if self.ticks.count > 0 {
            self.performSegue(withIdentifier: "goToRecognition2", sender: nil)
        } else {
            //Nothing was identified with a high enough confidence
            let alert = UIAlertController(title: "Error", message: "No ticks could be identified in your image. Either your image contains a tick that doesn't carry diseases, is too engorged to identify, or there isn't a tick in your image.", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (action) in
                alert.dismiss(animated: true, completion: nil)
            }))
            self.present(alert, animated: true, completion: nil)
        }
        
        self.coverUIView.isHidden = true
        self.activityUIActivityIndicator.stopAnimating()
    }
}


// Helper function inserted by Swift 4.2 migrator.
fileprivate func convertFromUIImagePickerControllerInfoKeyDictionary(_ input: [UIImagePickerController.InfoKey: Any]) -> [String: Any] {
	return Dictionary(uniqueKeysWithValues: input.map {key, value in (key.rawValue, value)})
}

// Helper function inserted by Swift 4.2 migrator.
fileprivate func convertFromUIImagePickerControllerInfoKey(_ input: UIImagePickerController.InfoKey) -> String {
	return input.rawValue
}
