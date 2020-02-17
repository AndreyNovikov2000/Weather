//
//  Extension for string.swift
//  Weather
//
//  Created by Andrey Novikov on 2/18/20.
//  Copyright © 2020 Andrey Novikov. All rights reserved.
//

import Foundation


// MARK: - GET CURRENT DATE
extension String {
    func getDate() -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        guard let date = dateFormatter.date(from: self) else { return "" }
        
        let calendar = Calendar.current
        let weekDay = calendar.component(.weekday, from: date)
        
        switch weekDay {
        case 1: return "Sunday"
        case 2: return "Monday"
        case 3: return "Tuesday"
        case 4: return "Wednesday"
        case 5: return "Thursday"
        case 6: return "Friday"
        case 7: return "Saturday"
        default: return ""
        }
    }
}


// MARK: - GET CURRENT TIME
extension String {
    func getTime() -> String {
        var timeString = ""
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        
        guard let date = dateFormatter.date(from: self) else { return "" }
        let calendar = Calendar.current
        
        let hour = calendar.component(.hour, from: date)
        let minute = calendar.component(.minute, from: date)
        
        switch hour {
        case let h where h == 0:
           timeString = "12:0\(minute)"
        case let h where h > 0 && h < 10:
            timeString = "0\(hour):0\(minute)"
        default:
            timeString = "\(hour):0\(minute)"
        }
        
        return timeString
    }
}


// MARK: - CONVERTE TIME FROM UINIX
extension String {
    func getTimeFromUnix(unixTime: Int) -> String {
        let timeInSecond = TimeInterval(unixTime)
        let weatherDate = Date(timeIntervalSince1970: timeInSecond)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        
        return dateFormatter.string(from: weatherDate)
    }
}


// MARK: - GET TEMPERATURE
extension String {
    static func convertableTemperature(country: String?, temperature: Double) -> String {
        if country == "US" {
            return  String(format: "%.0f", temperature * 1.8 - 459.67) + "°F"
        } else {
            return String(format: "%.0f", temperature - 275.15) + "°C"
        }
    }
}

