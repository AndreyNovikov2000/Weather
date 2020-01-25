//
//  OpenWeatherMap.swift
//  Weather
//
//  Created by Andrey Novikov on 1/25/20.
//  Copyright © 2020 Andrey Novikov. All rights reserved.
//

import Foundation

struct OpenWeatherMap {
    let nameCity: String
    let temp: Double
    
    init(weatherJson: NSDictionary) {
        nameCity = weatherJson["name"] as? String ?? ""
        
        let mainWeatherJSON = weatherJson["main"] as? [String: AnyObject]
        temp = mainWeatherJSON?["temp"] as? Double ?? 1.0
    }
}
