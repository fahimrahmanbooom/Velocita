//
//  SpeedViewController.swift
//  Velocita
//
//  Created by Fahim Rahman on 11/3/20.
//  Copyright © 2020 Fahim Rahman. All rights reserved.
//

import UIKit
import CoreLocation

class SpeedViewController: UIViewController, CLLocationManagerDelegate {
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .lightContent
    }
    
    @IBOutlet weak var speedLabel: UILabel!
    @IBOutlet weak var speedUnitLabel: UILabel!
    
    @IBOutlet weak var meterPerSecButton: UIButton!
    @IBOutlet weak var milesPerHrButton: UIButton!
    @IBOutlet weak var kmPerHrButton: UIButton!
    
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        designingUI()
        askingForUserLocationAndGpsPermission()
    }

}


// Asking for user's location and GPS Permission from the user.

extension SpeedViewController {
    
    // Taking permission from the user to get the current location
    
    func askingForUserLocationAndGpsPermission() {
        let authorizationStatus = CLLocationManager.authorizationStatus()
        if authorizationStatus == .notDetermined {
            locationManager.requestWhenInUseAuthorization()
            return
        }
        
        if authorizationStatus == .denied || authorizationStatus == .restricted {
            reportLocationServicesDeniedError()
            return
        }
            
        else {
            locationUpdated()
        }
    }
    
    
    // Getting the location from the user's phone
    
    func locationUpdated() {
        
        if CLLocationManager.locationServicesEnabled() {
            
            locationManager.delegate = self
            locationManager.desiredAccuracy = kCLLocationAccuracyBest
            locationManager.startUpdatingLocation()
            
            //showingCurrentSpeed()
        }
    }
    
    // Letting user know that system did't get permission
    
    func reportLocationServicesDeniedError() {
        
        let alert = UIAlertController(title: "Location Service Disabled.", message: "Please go to Setting > Privacy to enable location service for this app.", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { (action) in
            print("Denied Location Service")
        }))
        self.present(alert, animated: true, completion: nil)
    }
}




// Showing the speed

extension SpeedViewController {
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let location = locations[0]
        speedLabel.text = String(Int(location.speed))
    }
}




// Designing UI //

extension SpeedViewController {
    
    func designingUI() {
        
        // Buttons
        
        meterPerSecButton.layer.borderWidth = 3
        meterPerSecButton.layer.borderColor = UIColor.white.cgColor
        meterPerSecButton.layer.cornerRadius = meterPerSecButton.frame.height / 2
        
        milesPerHrButton.layer.borderWidth = 3
        milesPerHrButton.layer.borderColor = UIColor.white.cgColor
        milesPerHrButton.layer.cornerRadius = milesPerHrButton.frame.height / 2
        
        kmPerHrButton.layer.borderWidth = 3
        kmPerHrButton.layer.borderColor = UIColor.white.cgColor
        kmPerHrButton.layer.cornerRadius = kmPerHrButton.frame.height / 2
        
        // Tab Bar Items
        
        UITabBar.appearance().tintColor = UIColor.white
        UITabBar.appearance().unselectedItemTintColor = UIColor.lightGray
    }
}
