//
//  WeatherLocation.swift
//  WeatherGift
//
//  Created by Thomas Ronan on 3/17/19.
//  Copyright © 2019 Thomas Ronan. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class WeatherLocation {
    var name = ""
    var coordinates = ""
    var currentTemp = "--"
    var dailySummary = "--"
    var currentIcon = ""
    
    func getWeather(completed: @escaping () -> ()) {
        let weatherURL = urlBase + urlApiKey + coordinates
        Alamofire.request(weatherURL).responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                if let temperature = json["currently"]["temperature"].double {
                    print("******** temperature inside getWeather = \(temperature)")
                    let roundedTemp = String(format: "%3.f", temperature)
                    self.currentTemp = roundedTemp + "°"
                } else {
                    print("Could not return temeprature")
                }
                if let summary = json["hourly"]["summary"].string {
                    self.dailySummary = summary
                } else {
                    print("Could not return daily weather summary")
                }
                if let icon = json["currently"]["icon"].string {
                    self.currentIcon = icon
                } else {
                    print("Could not return an icon")
                }
            case .failure(let error):
                print(error)
            }
            completed()
        }
    }
}
