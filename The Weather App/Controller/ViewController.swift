//
//  ViewController.swift
//  The Weather App
//
//  Created by Steven Penava on 5/24/18.
//  Copyright © 2018 Steven Penava. All rights reserved.
//

import UIKit
import CoreLocation
import Alamofire
import SwiftyJSON

class ViewController: UIViewController, CLLocationManagerDelegate {

    // MARK: Outlets and class variables
    /* ------------------------------------------------------------------ */
    @IBOutlet weak var cityView: UIView!
    @IBOutlet weak var weatherView: UIView!
    @IBOutlet weak var tempLabel: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var weatherDescriptionLabel: UILabel!
    @IBOutlet weak var textRecommendationLabel: UILabel!
    
    let WEATHER_URL = "http://api.openweathermap.org/data/2.5/weather"
    let API_KEY     = "14353c70d516758f4e44812a41d5ecb0"
    
    let locationManager = CLLocationManager()
    let weatherDataModel = WeatherDataModel()
    let backGroundColorModel = BackgroundColorModel()
    
    // Upon loading...
    override func viewDidLoad() {
        super.viewDidLoad()
        textRecommendationLabel.isHidden = true
        
        // When to animate label appearance? This causes an issue when asking for location access.
        animateLabelAppearance()

        
        // Setting ViewController.swift as the delegate for the CoreLocation data reporting
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
        
       

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: User interface-related functions
    /* ------------------------------------------------------------------ */
    func updateUIWithWeatherData() {
        self.view.backgroundColor = backGroundColorModel.getBackGroundColorBasedOnTemp(temperature: weatherDataModel.temperature, unit: "F")
        print(weatherDataModel.temperature)
        cityLabel.text = weatherDataModel.city
        tempLabel.text = String(weatherDataModel.temperature) + "º"
        weatherDescriptionLabel.text = weatherDataModel.condition
    }
    
    // MARK: JSON & API interaction functions
    /* ------------------------------------------------------------------ */
    
    /* Gets weather data with Alamofire */
    func getWeatherData(url:String, parameters:[String:String]) {
        Alamofire.request(url, method: .get, parameters: parameters).responseJSON {
            response in
            if response.result.isSuccess { // triggered when background process is completed
                print("Success! Got the weather data.")
                
                // Response into JSON
                let weatherJSON : JSON = JSON(response.result.value!) // comes in an optional
                self.updateWeatherData(json: weatherJSON)
                
            } else {
                print("Error \(response.result.error)")
                self.cityLabel.text = "Error."
            }
        }
    }
    
    /* Updates data model and calls UI update */
    func updateWeatherData(json : JSON) {
        if let tempResult = json["main"]["temp"].double {
            weatherDataModel.temperature     = Int(convertUnit(to: "F", from: "K", num: tempResult))
            weatherDataModel.city            = json["name"].stringValue
            weatherDataModel.condition       = json["weather"][0]["description"].stringValue
            updateUIWithWeatherData()
        } else {
            cityLabel.text = "Weather Unavailable."
            print("err")
        }
    }
    
    // MARK: CoreLocation manager delegate methods
    /* ------------------------------------------------------------------ */
    
    /* Got current location */
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let currentLocation = locations[locations.count - 1]
        if currentLocation.horizontalAccuracy > 0 { // check to ensure location is valid
            locationManager.stopUpdatingLocation()
            locationManager.delegate = nil // to stop getting location data so it only prints once
            let latitude  = String(currentLocation.coordinate.latitude)
            let longitude = String(currentLocation.coordinate.longitude)
            
            let callParams : [String: String] = ["lat": latitude, "lon": longitude, "appid" : API_KEY]
            getWeatherData(url: WEATHER_URL, parameters: callParams)
        }
    }
    
    /* Handle event of location settings changing */
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .notDetermined:
            print("Not yet determined.")
        case .authorizedWhenInUse:
            print("Authorized when in use.")
            
            // Load UI
//            animateLabelAppearance()
            
        case .authorizedAlways:
            print("Authorized always")
        case .restricted:
            print("Authorization Restricted.")
        case .denied:
            print("Authorization Denied.")
        default:
            break
        }
    }
    
    // MARK: Animation functions
    /* ------------------------------------------------------------------ */
    
    /* Making text fade in */
    func animateLabelAppearance() {
        weatherView.alpha = 0.0
        cityView.alpha = 0.0
        cityView.fadeIn()
        weatherView.fadeIn()
    }
    
    // MARK: Utility functions
    /* ------------------------------------------------------------------ */
    
    /* Unit conversion */
    func convertUnit(to:String, from:String, num:Double) -> Double {
        if from == "K" && to == "F" {
            return num * 1.8 - 459.67
        }
        return 0.0
    }
}

