// JSON PARSE
// Created by Ashank Singh on 7/22/17.
// Copyright © 2017 Ashank Singh. All rights reserved.

import UIKit

var subdomain = "9947bc34"
let apiURL = "https://"+subdomain+".ngrok.io"

var temperatureF = 0.0
var temperatureC = 0.0
var distanceIn = 0.0

if let url = URL(string: apiURL) {
    if let data = try? Data(contentsOf: url) {
        do {
            let parsedData = try JSONSerialization.jsonObject(with: data as Data, options: .allowFragments) as! [String:Any]
            let currentTemperatureF = (parsedData["Temperature_Fahrenheit"] as! NSString).doubleValue
            let currentTemperatureC = (parsedData["Temperature_Celsius"] as! NSString).doubleValue
            let currentDistanceIn = (parsedData["Distance"] as! NSString).doubleValue
         
            temperatureF = currentTemperatureF
            temperatureC = currentTemperatureC
            distanceIn = currentDistanceIn
            
        }
        catch let error as NSError {
            print("Details of JSON parsing error:\n \(error)")
        }
    }
}
