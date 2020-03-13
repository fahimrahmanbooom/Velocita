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
        meterPerSecButton.layer.backgroundColor = UIColor.white.cgColor
        meterPerSecButton.tintColor = UIColor(red: 65/255, green: 81/255, blue: 174/255, alpha: 1)
        meterPerSecButton.layer.borderWidth = 1
        meterPerSecButton.layer.borderColor = UIColor.black.cgColor
        meterPerSecButton.layer.cornerRadius = meterPerSecButton.frame.height / 2
        
        // Miles/h Button
        milesPerHrButton.layer.backgroundColor = UIColor.white.cgColor
        milesPerHrButton.tintColor = UIColor(red: 65/255, green: 81/255, blue: 174/255, alpha: 1)
        milesPerHrButton.layer.borderWidth = 1
        milesPerHrButton.layer.borderColor = UIColor.black.cgColor
        milesPerHrButton.layer.cornerRadius = milesPerHrButton.frame.height / 2
        
        // Km/h
        kmPerHrButton.layer.backgroundColor = UIColor.white.cgColor
        kmPerHrButton.tintColor = UIColor(red: 65/255, green: 81/255, blue: 174/255, alpha: 1)
        kmPerHrButton.layer.borderWidth = 1
        kmPerHrButton.layer.borderColor = UIColor.black.cgColor
        kmPerHrButton.layer.cornerRadius = kmPerHrButton.frame.height / 2
        
        // Tab Bar Items
        
        UITabBar.appearance().tintColor = UIColor.white
        UITabBar.appearance().unselectedItemTintColor = UIColor.lightGray
    }
}
