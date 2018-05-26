//
//  BackgroundColorModel.swift
//  The Weather App
//
//  Created by Steven Penava on 5/26/18.
//  Copyright © 2018 Steven Penava. All rights reserved.
//

import Foundation
import UIKit
import HexColors


class BackgroundColorModel {
    
    var color : UIColor?
    
    func getBackGroundColorBasedOnTemp(temperature:Int, unit:String) -> UIColor {
        switch temperature {
            case -999...32:
                // Freezing and below
                return UIColor("#030072")!
            case 33...55:
                // Light blue (cold)
                return UIColor("#7712B2")!
            case 56...70:
                // Green (Nice to chilly)
                return UIColor("#02B22B")!
            case 71...80:
                // Orange (Nice day)
                return UIColor("#e55300")!
            case 81...999:
                // Dark red (Hot)
                return UIColor("#B50000")!
            default:
                print()
        }
        return .red
    }
    
}
