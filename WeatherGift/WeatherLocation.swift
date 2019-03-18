//
//  WeatherLocation.swift
//  WeatherGift
//
//  Created by Thomas Ronan on 3/17/19.
//  Copyright © 2019 Thomas Ronan. All rights reserved.
//

import Foundation
import Alamofire

class WeatherLocation {
    var name = ""
    var coordinates = ""
    func getWeather() {
        let weatherURL = urlBase + urlApiKey + coordinates
        print(weatherURL)
        Alamofire.request(weatherURL).responseJSON { response in
            print(response)
        }
    }
}
