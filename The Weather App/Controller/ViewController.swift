//
//  ViewController.swift
//  The Weather App
//
//  Created by Steven Penava on 5/24/18.
//  Copyright © 2018 Steven Penava. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: Outlets and class variables
    @IBOutlet weak var cityView: UIView!
    @IBOutlet weak var weatherView: UIView!
    @IBOutlet weak var tempLabel: UILabel!
    
    // Upon loading...
    override func viewDidLoad() {
        super.viewDidLoad()
        animateLabelAppearance()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: Animation functions
    
    // Making text fade in
    func animateLabelAppearance() {
        weatherView.alpha = 0.0
        cityView.alpha = 0.0
        cityView.fadeIn()
        weatherView.fadeIn()
    }


}

