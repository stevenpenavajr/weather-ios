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
                print()
                return UIColor("#b281ff")!
            case 33...55:
                print()
                return UIColor("#b281ff")!
            case 56...70:
                print()
                return UIColor("#b281ff")!
            case 71...80:
                print()
                return UIColor("#33d0ff")!
            case 81...100:
                return UIColor("#ff6e02")!
            case 100...999:
                print()
                return UIColor("#ff0119")!
            default:
                print()
        }
        return .red
    }
    
}
