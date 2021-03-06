//
//  ViewController.swift
//  PongStat
//
//  Created by Cowboy Lynk on 6/21/17.
//  Copyright © 2017 Cowboy Lynk. All rights reserved.
//

import UIKit

class StartViewController: UIViewController {
    // Outlets
    @IBOutlet weak var newGameButton: UIButton!
    @IBOutlet weak var statsButton: UIButton!
    @IBOutlet weak var instructionsButton: UIButton!

    override func viewDidLoad() {
        
        // Custom button appearances
        newGameButton.layer.shadowColor = UIColor(red:0.80, green:0.20, blue:0.10, alpha: 1.0).cgColor
        newGameButton.layer.shadowOpacity = 1
        newGameButton.layer.shadowRadius = 0
        newGameButton.layer.shadowOffset = CGSize(width: 0, height: 5)
        newGameButton.layer.cornerRadius = 15
        
        statsButton.layer.shadowColor = UIColor(red:0.5, green:0.5, blue:0.5, alpha: 1.0).cgColor
        statsButton.layer.shadowOpacity = 1
        statsButton.layer.shadowRadius = 0
        statsButton.layer.shadowOffset = CGSize(width: 0, height: 5)
        statsButton.layer.cornerRadius = 15
        
        instructionsButton.layer.shadowColor = UIColor(red:0.5, green:0.5, blue:0.5, alpha: 1.0).cgColor
        instructionsButton.layer.shadowOpacity = 1
        instructionsButton.layer.shadowRadius = 0
        instructionsButton.layer.shadowOffset = CGSize(width: 0, height: 5)
        instructionsButton.layer.cornerRadius = 15
        
        // Nav bar
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 30, height: 20))
        imageView.contentMode = UIViewContentMode.scaleAspectFit
        let image = UIImage(named: "Title")
        imageView.image = image
        navigationItem.titleView = imageView
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

