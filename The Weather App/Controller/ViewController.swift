/* ViewController.swift */

/* Import statements */
import UIKit
import CoreLocation
import Alamofire
import SwiftyJSON

/* Main ViewController */
class ViewController: UIViewController, CLLocationManagerDelegate {
    
    /**
     * @title   : didReceiveMemoryWarning()
     * @purpose : System calls this when memory is low. Memory can be released here.
     * @params  : none
     * @return  : none
     **/
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

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
    
    /**
     * @title   : viewDidLoad()
     * @purpose : Executes upon app start/the main view controller loading.
     * @params  : none
     * @return  : none
    **/
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.delegate = self
        weatherView.isHidden = true
        cityView.isHidden = true
        locationManager.requestWhenInUseAuthorization()
        
        // TODO: Ask if male or female
        
        locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        locationManager.startUpdatingLocation()
    }

    // MARK: User interface-related functions
    /* ------------------------------------------------------------------ */
    
    /**
     * @title   : updateUIWithWeatherData()
     * @purpose : Sets background based on temp, sets city, temp, description labels.
     * @params  : none
     * @return  : none
     **/
    func updateUIWithWeatherData() {
        self.view.backgroundColor = backGroundColorModel.getBackGroundColorBasedOnTemp(temperature: weatherDataModel.temperature, unit: "F")
        cityLabel.text = weatherDataModel.city
        tempLabel.text = String(weatherDataModel.temperature) + "º"
        weatherDescriptionLabel.text = weatherDataModel.condition
    }
    
    // MARK: JSON & API interaction functions
    /* ------------------------------------------------------------------ */
    
    /**
     * @title   : getWeatherDataFromOpenWeather(url, parameters)
     * @purpose : Gets JSON data from the API.
     * @params  : url (String), parameters (String:String dict)
     *              url = OpenWeather API call URL.
     *              parameters = e.g. lat, long, api key
     * @return  : none
     **/
    func getWeatherDataFromOpenWeather(url:String, parameters:[String:String]) {
        Alamofire.request(url, method: .get, parameters: parameters).responseJSON {
            response in
            if response.result.isSuccess { // triggered when background process is completed
                print("Success! Got the weather data.")
                let weatherJSON : JSON = JSON(response.result.value!) // comes in an optional
                self.updateWeatherDataModel(json: weatherJSON)
            } else {
                print("Error \(response.result.error)")
                self.cityLabel.text = "Error."
            }
        }
    }
    
    /**
     * @title   : updateWeatherDataModel(json)
     * @purpose : Updates the data model's current settings.
     * @params  : json (JSON)
     *              json = JSON data from OpenWeather
     * @return  : none
     **/
    func updateWeatherDataModel(json : JSON) {
        if let tempResult                    = json["main"]["temp"].double {
            weatherDataModel.temperature     = Int(tempResult)
            weatherDataModel.city            = json["name"].stringValue
            weatherDataModel.condition       = json["weather"][0]["description"].stringValue
            updateUIWithWeatherData()
        } else {
            cityLabel.text = "Weather Unavailable."
            print("Error! Weather unavailable.")
        }
    }
    
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
    
    // MARK: Animation functions
    /* ------------------------------------------------------------------ */
    
    /**
     * @title   : animateLabelAppearance()
     * @purpose : Fades in the views. This will probably change.
     * @params  : none
     * @return  : none
     **/
    func animateLabelAppearance() {
        weatherView.alpha = 0.0
        cityView.alpha = 0.0
        cityView.fadeIn()
        weatherView.fadeIn()
    }
}

