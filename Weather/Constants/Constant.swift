//
//  Constant.swift
//  Weather
//
//  Created by Andrey Novikov on 2/3/20.
//  Copyright © 2020 Andrey Novikov. All rights reserved.
//

import UIKit

let  CITY_WEATHER_URL = "https://api.openweathermap.org/data/2.5/weather?q=CITY,forecast?id=524901&appid=5ad2283b07a684c9b4541b10d1739494"
let CITY_WEARHER_FIVE_DAYS_URL = "https://api.openweathermap.org/data/2.5/forecast?q=CITY&appid=5ad2283b07a684c9b4541b10d1739494"
let LAT_LON_WEATHER_URL = "https://api.openweathermap.org/data/2.5/weather?lat=DOUBLE5&lon=DOUBLE&appid=5ad2283b07a684c9b4541b10d1739494"
let LAT_LON_WEARHER_FIVE_DAYS_URL = "https://api.openweathermap.org/data/2.5/forecast?lat=DOUBLE&lon=DOUBLE&appid=5ad2283b07a684c9b4541b10d1739494"

struct Constants {
    static let leftDistanceToView: CGFloat = 30
    static let rightDistanceToView: CGFloat = 30
    static let minimumSpacing: CGFloat = 20
    static let cellsWidth: CGFloat = (UIScreen.main.bounds.width -
        Constants.leftDistanceToView -
        Constants.rightDistanceToView -
        (Constants.minimumSpacing / 4)) / 5
}
