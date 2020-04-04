//
//  UIDesign.swift
//  Velocita
//
//  Created by Fahim Rahman on 13/3/20.
//  Copyright © 2020 Fahim Rahman. All rights reserved.
//

import UIKit

// Designing UI //

extension SpeedViewController {
    
    func designingUI() {
        
        // Speed View BG color
        
        self.view.backgroundColor = UIColor(red: 65/255, green: 81/255, blue: 174/255, alpha: 1)
        
        // Buttons
        
        // Meter/s Button
        meterPerSecButton.layer.backgroundColor = UIColor(red: 226/255, green: 61/255, blue: 13/255, alpha: 1).cgColor
        meterPerSecButton.setTitleColor(.white, for: .normal)
        meterPerSecButton.layer.cornerRadius = meterPerSecButton.frame.height / 2
        
        // Miles/h Button
        milesPerHrButton.layer.backgroundColor = UIColor.white.cgColor
        milesPerHrButton.tintColor = UIColor(red: 65/255, green: 81/255, blue: 174/255, alpha: 1)
        milesPerHrButton.layer.cornerRadius = milesPerHrButton.frame.height / 2
        
        // Km/h
        kmPerHrButton.layer.backgroundColor = UIColor.white.cgColor
        kmPerHrButton.tintColor = UIColor(red: 65/255, green: 81/255, blue: 174/255, alpha: 1)
        kmPerHrButton.layer.cornerRadius = kmPerHrButton.frame.height / 2
        
        // Tab Bar Items
        
        UITabBar.appearance().tintColor = UIColor.white
        UITabBar.appearance().unselectedItemTintColor = UIColor.lightGray
    }
}
