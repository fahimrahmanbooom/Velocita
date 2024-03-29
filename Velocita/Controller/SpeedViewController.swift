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
    @IBOutlet weak var maxSpeedLabel: UILabel!
    @IBOutlet weak var speedUnitLabel: UILabel!
    
    @IBOutlet weak var meterPerSecButton: UIButton!
    @IBOutlet weak var milesPerHrButton: UIButton!
    @IBOutlet weak var kmPerHrButton: UIButton!
    
    var speed:Double = Double()
    var maxSpeed:Double = Double()
    
    var unitConversionValue:Double = Double()
    
    let locationManager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        speedLabel.text = "0"
        speedUnitLabel.text = "Meters/Second"
        speed = 0
        maxSpeed = speed
        unitConversionValue = 1
        
        meterPerSecButton.tag = 0
        milesPerHrButton.tag = 1
        kmPerHrButton.tag = 2
        
        designingUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        askingForUserLocationAndGpsPermission()
    }
    
    @IBAction func unitChangedButtonTapped(_ sender: UIButton) {
        
        if sender.tag == 0 {
            
            DispatchQueue.main.async {
                self.colorChangeForMeterPerSecPressed()
            }
            
            speedUnitLabel.text = "Meters/Second"
            maxSpeed = 0
            return unitConversionValue = 1
        }
        if sender.tag == 1 {
            
            DispatchQueue.main.async {
                self.colorChangeForMilesPerHourPressed()
            }
            speedUnitLabel.text = "Miles/Hour"
            maxSpeed = 0
            return unitConversionValue = 2.236936
        }
        if sender.tag == 2 {
            
            DispatchQueue.main.async {
                self.colorChangeForKilometersPerHourPressed()
            }
            speedUnitLabel.text = "Kilometers/Hour"
            maxSpeed = 0
            return unitConversionValue = 3.6
        }
    }
    
    @IBAction func aboutButton(_ sender: UIButton) {
        
        if let aboutViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "aboutViewController") as? AboutViewController {
            self.present(aboutViewController, animated: true, completion: nil)
        }
        
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
        let location = locations.last
        
        speed = (location?.speed ?? 0) * unitConversionValue
        
        if speed > maxSpeed {
            maxSpeed = speed
        }
        
        if speed >= 0 {
            speedLabel.text = String(Int(speed))
            maxSpeedLabel.text = String(Int(maxSpeed))
        }
    }
}



// Button's color changing methods

extension SpeedViewController {
    
    func colorChangeForMeterPerSecPressed() {
        
        // Meter/s Button
        meterPerSecButton.layer.backgroundColor = UIColor(red: 226/255, green: 61/255, blue: 13/255, alpha: 1).cgColor
        meterPerSecButton.setTitleColor(.white, for: .normal)
        
        // Miles/h Button
        milesPerHrButton.layer.backgroundColor = UIColor.white.cgColor
        milesPerHrButton.setTitleColor(UIColor(red: 65/255, green: 81/255, blue: 174/255, alpha: 1), for: .normal)
        
        // Km/h
        kmPerHrButton.layer.backgroundColor = UIColor.white.cgColor
        kmPerHrButton.setTitleColor(UIColor(red: 65/255, green: 81/255, blue: 174/255, alpha: 1), for: .normal)
        
    }
    
    func colorChangeForMilesPerHourPressed() {
        
        // Meter/s Button
        meterPerSecButton.layer.backgroundColor = UIColor.white.cgColor
        meterPerSecButton.setTitleColor(UIColor(red: 65/255, green: 81/255, blue: 174/255, alpha: 1), for: .normal)
        
        // Miles/h Button
        milesPerHrButton.layer.backgroundColor = UIColor(red: 226/255, green: 61/255, blue: 13/255, alpha: 1).cgColor
        milesPerHrButton.setTitleColor(.white, for: .normal)
        
        // Km/h
        kmPerHrButton.layer.backgroundColor = UIColor.white.cgColor
        kmPerHrButton.setTitleColor(UIColor(red: 65/255, green: 81/255, blue: 174/255, alpha: 1), for: .normal)
        
    }
    
    func colorChangeForKilometersPerHourPressed() {
        
        // Meter/s Button
        meterPerSecButton.layer.backgroundColor = UIColor.white.cgColor
        meterPerSecButton.setTitleColor(UIColor(red: 65/255, green: 81/255, blue: 174/255, alpha: 1), for: .normal)
        
        // Miles/h Button
        milesPerHrButton.layer.backgroundColor = UIColor.white.cgColor
        milesPerHrButton.setTitleColor(UIColor(red: 65/255, green: 81/255, blue: 174/255, alpha: 1), for: .normal)
        
        // Km/h
        kmPerHrButton.layer.backgroundColor = UIColor(red: 226/255, green: 61/255, blue: 13/255, alpha: 1).cgColor
        kmPerHrButton.setTitleColor(.white, for: .normal)
    }
}
