/* ViewController.swift */

/* Import statements */
import UIKit
import CoreLocation
import Alamofire
import SwiftyJSON

/* Main ViewController */
class ViewController: UIViewController {
    
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
    @IBOutlet weak var recommendationLabel: UILabel!
    @IBOutlet weak var weatherDescriptionLabel: UILabel!
    
    let WEATHER_URL = "http://api.openweathermap.org/data/2.5/weather"
    let API_KEY     = "14353c70d516758f4e44812a41d5ecb0"
    
    let locationManager = CLLocationManager()
    let weatherDataModel = WeatherDataModel()
    
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
        if let tempResult                          = json["main"]["temp"].double {
            weatherDataModel.temperature           = Int(tempResult)
            weatherDataModel.city                  = json["name"].stringValue
            weatherDataModel.primaryConditions     = weatherDataModel.createConditionHierarchy(json: json, identifier: "weather") // to be used with recommendation choosing algorithm
            weatherDataModel.currentDescription    = json["weather"][0]["description"].stringValue
//            weatherDataModel.currentRecommendation = PhrasesDataModel.getPhraseToUse(temp: weatherDataModel.temperature, conditions: weatherDataModel.primaryConditions, gender: "male")
            
            updateUIWithWeatherData()
        } else {
            cityLabel.text = "Weather Unavailable."
            print("Error! Weather unavailable.")
        }
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
        cityLabel.text = weatherDataModel.city
        tempLabel.text = String(weatherDataModel.temperature) + "º"
//        recommendationLabel.text = PhrasesDataModel.getPhraseToUse(temp: weatherDataModel.temperature, conditions: weatherDataModel.primaryConditions, gender: "Male")
        weatherDescriptionLabel.text = weatherDataModel.currentDescription.capitalized
//        weatherDescriptionLabel.text = ConditionCodesDataModel.condition3xx
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

