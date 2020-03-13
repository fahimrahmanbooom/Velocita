//
//  MapViewController.swift
//  Velocita
//
//  Created by Fahim Rahman on 11/3/20.
//  Copyright © 2020 Fahim Rahman. All rights reserved.
//

import UIKit
import MapKit
import CoreLocation

class MapViewController: UIViewController, CLLocationManagerDelegate {
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        .lightContent
    }
    
    @IBOutlet weak var mapView: MKMapView!
    
    let manager = CLLocationManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Map View BG color
        self.view.backgroundColor = UIColor(red: 65/255, green: 81/255, blue: 174/255, alpha: 1)
        
        manager.delegate = self
        manager.desiredAccuracy = kCLLocationAccuracyBest
        manager.startUpdatingLocation()
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        
        let span = MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01)
        let myLocation = CLLocationCoordinate2D(latitude: locations.last?.coordinate.latitude ?? 0, longitude: locations.last?.coordinate.longitude ?? 0)
        let region = MKCoordinateRegion(center: myLocation, span: span)
        self.mapView.setRegion(region, animated: true)
        
    }
}
