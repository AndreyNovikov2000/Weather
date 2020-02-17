//
//  ex UIView.swift
//  Weather
//
//  Created by Andrey Novikov on 2/16/20.
//  Copyright © 2020 Andrey Novikov. All rights reserved.
//

import UIKit

extension UIImage {
    // MARK: GET WEATHER ICON
    static func getWetherIcon(condition: Int, nightTime: Bool) -> UIImage {
        var imageName: String
        
        switch (condition, nightTime) {
        //Thunderstorm
        case let (c, n) where c < 300 && n == false: imageName = "11d"
        case let (c, n) where c < 300 && n == true: imageName = "11n"
            
        //Drizzle
        case let (c, n) where c < 400 && n == false: imageName = "09d"
        case let (c, n) where c < 400 && n == true: imageName = "09n"
            
        // Rain
        case let (c, n) where (c >= 500 && c <= 504) && n == false : imageName = "10d"
        case let (c, n) where (c >= 500 && c <= 504) && n == true: imageName = "10n"
        case let (c , n) where c == 511 && n == false: imageName = "13d"
        case let (c, n) where c == 511 && n == true: imageName = "13n"
        case let (c, n) where c < 600 && n == false: imageName = "09d"
        case let (c, n) where c < 600 && n == true: imageName = "09n"
            
        //Snow
        case let (c, n) where c < 700 && n == false: imageName = "13d"
        case let (c, n) where c < 700 && n == true: imageName = "13n"
            
        //Atmosphere
        case let (c, n) where c < 800 && n == false: imageName = "50d"
        case let (c, n) where c < 800 && n == true: imageName = "50n"
            
        //Clear
        case let (c, n) where c == 800 && n == false: imageName = "01d"
        case let (c, n) where c == 800 && n == true: imageName = "01n"
            
        //Clouds
        case let (c, n) where c == 801 && n == false: imageName = "02d"
        case let (c, n) where c == 801 && n == true: imageName = "02n"
        case let (c, n) where c == 802 && n == false: imageName = "03d"
        case let (c, n) where c == 802 && n == true: imageName = "03n"
        case let (c, n) where c < 900 && n == false: imageName = "04d"
        case let (c, n) where c < 900 && n == true: imageName = "04n"
        default: imageName = "none"
        }
        
        return UIImage(named: imageName) ?? UIImage()
    }
}
