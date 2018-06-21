//
//  WeatherDataModel.swift
//  The Weather App
//
//  Created by Steven Penava on 5/24/18.
//  Copyright © 2018 Steven Penava. All rights reserved.
//

import Foundation
import SwiftyJSON

class WeatherDataModel {
    var temperature           :Int            = 0
    var city                  :String         = ""
    var primaryConditions     :[Int]          = []
    var currentDescription    :String         = ""
    
    /**
     * @title   : createConditionHierarchy(json, identifier)
     * @purpose : get an array of code values to get the current conditions in
     *            order of prominence (index 0 is the most prominent)
     * @params  : json (JSON), identifier (String)
     *              json = OpenWeather full JSON response
     *              identifier = should be "weather" to narrow JSON down
     * @return  : [Int] - an array of indexes with 0th index being most prominent
     **/
    func createConditionHierarchy(json: JSON, identifier: String) -> [Int] {
        
        var conditionArray : [Int] = []
        
        for (key, value) in json[identifier] {
            var subJSON = json[identifier][Int(key)!]
            let code    = subJSON["id"].intValue
            conditionArray.append(code)
        }
        return conditionArray
    }
}
