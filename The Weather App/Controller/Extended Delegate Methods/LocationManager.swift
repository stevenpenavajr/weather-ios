// File: ViewControllerCoreLocationMgrDelegate.Swift
// Purpose: <enter purpose>
// Date Created: 6/20/18
// Created By: Steven Penava

import Foundation
import CoreLocation

extension ViewController: CLLocationManagerDelegate {
    
    // MARK: CoreLocation manager delegate methods
    /* ------------------------------------------------------------------ */
    
    /**
     * @title   : locationManager: didUpdateLocations
     * @purpose : Handles location updating.
     * @params  : manager (CLLocationManager), locations (CLLocation)
     * @return  : none
     **/
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let currentLocation = locations[locations.count - 1]
        if currentLocation.horizontalAccuracy > 0 { // check to ensure location is valid
            locationManager.stopUpdatingLocation()
            locationManager.delegate = nil // to stop getting location data so it only prints once
            let latitude  = String(currentLocation.coordinate.latitude)
            let longitude = String(currentLocation.coordinate.longitude)
            let callParams : [String: String] = ["lat": latitude, "lon": longitude, "appid" : API_KEY, "units":"imperial"]
            getWeatherDataFromOpenWeather(url: WEATHER_URL, parameters: callParams)
        }
    }
    
    /**
     * @title   : locationManager: didChangeAuthorization
     * @purpose : Handles changes in location access authorization.
     * @params  : manager (CLLocationManager), status (CLAuthorizationStatus)
     * @return  : none
     **/
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        switch status {
        case .notDetermined:
            print("Not yet determined.")
        case .authorizedWhenInUse:
            print("Authorized when in use.")
            
            print("Unhiding views and fading in UI.")
            weatherView.isHidden = false
            cityView.isHidden = false
            animateLabelAppearance()
            
        case .authorizedAlways:
            print("Authorized always")
        case .restricted:
            print("Authorization Restricted.")
        case .denied:
            print("Authorization Denied.")
            print("We'll need your location data to function.")
        default:
            break
        }
    }
    
}
