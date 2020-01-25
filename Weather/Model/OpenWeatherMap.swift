//
//  OpenWeatherMap.swift
//  Weather
//
//  Created by Andrey Novikov on 1/25/20.
//  Copyright © 2020 Andrey Novikov. All rights reserved.
//

import UIKit

struct OpenWeatherMap {
    let nameCity: String
    let temp: Double
    let description: String
    let currentTime: Int
    let icon: String
    
    init(weatherJson: NSDictionary) {
        nameCity = weatherJson["name"] as? String ?? ""
        
        let mainWeatherJSON = weatherJson["main"] as? [String: AnyObject]
        temp = mainWeatherJSON?["temp"] as? Double ?? 1.0
        
        let weather = weatherJson["weather"] as? [[String: AnyObject]]
        let firstIndexOfWeather = weather?[0]
        description = firstIndexOfWeather?["description"] as? String ?? ""
        
        currentTime = weatherJson["dt"] as? Int ?? 0
        
        icon = firstIndexOfWeather?["icon"] as? String ?? ""
    }
    
    func getTimeFromUnix(unixTime: Int) -> String {
        let timeInSecond = TimeInterval(unixTime)
        let weatherDate = Date(timeIntervalSince1970: timeInSecond)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        
        return dateFormatter.string(from: weatherDate)
    }
    
    func getWetherIcon(stringIcon: String) -> UIImage {
        var imageName: String
        
        switch stringIcon {
        case "01d": imageName = "01d"
        case "02d": imageName = "02d"
        case "03d": imageName = "03d"
        case "04d": imageName = "04d"
        case "09d": imageName = "09d"
        case "10d": imageName = "10d"
        case "11d": imageName = "11d"
        case "13d": imageName = "13d"
        case "50d": imageName = "50d"
        case "01n": imageName = "01n"
        case "02n": imageName = "02n"
        case "03n": imageName = "03n"
        case "04n": imageName = "04n"
        case "09n": imageName = "09n"
        case "10n": imageName = "10n"
        case "11n": imageName = "11n"
        case "13n": imageName = "13n"
        case "50n": imageName = "50n"
        default: imageName = "none"
        }
        
        return UIImage(named: imageName)!
    }
}
