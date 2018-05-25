//
//  UIViewExtensions.swift
//  The Weather App
//
//  Created by Steven Penava on 5/25/18.
//  Copyright © 2018 Steven Penava. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    func fadeIn() {
        UIView.animate(withDuration: 0.5, delay: 0.5, options: UIViewAnimationOptions.curveEaseIn, animations: {
            self.alpha = 1.0 // Instead of a specific instance of, say, birdTypeLabel, we simply set [thisInstance] (ie, self)'s alpha
        }, completion: nil)
    }
    
    func fadeOut() {
        UIView.animate(withDuration: 1.0, delay: 0.0, options: UIViewAnimationOptions.curveEaseOut, animations: {
            self.alpha = 0.0
        }, completion: nil)
    }
}
