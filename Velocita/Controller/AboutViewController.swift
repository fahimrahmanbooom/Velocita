//
//  AboutViewController.swift
//  Velocita
//
//  Created by Fahim Rahman on 13/3/20.
//  Copyright © 2020 Fahim Rahman. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController {

    @IBOutlet weak var aboutLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // About View BG color

        self.view.backgroundColor = UIColor(red: 65/255, green: 81/255, blue: 174/255, alpha: 1)

        aboutLabel.layer.borderWidth = 0.5
        aboutLabel.layer.borderColor = UIColor.white.cgColor
        aboutLabel.text = "Velocita is a speedometer app to measure car, bike speed.\n\nThis is most easiest speedometer app and the best bike and car speedometer you can ever find.\n\nDeveloper: Fahim Rahman"
    }
}
