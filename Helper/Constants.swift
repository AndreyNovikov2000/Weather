//
//  Constants.swift
//  Weather
//
//  Created by Andrey Novikov on 1/27/20.
//  Copyright © 2020 Andrey Novikov. All rights reserved.
//

let  BASE_WEATHER_URL = "https://api.openweathermap.org/data/2.5/weather?q=CITY,forecast?id=524901&appid=5ad2283b07a684c9b4541b10d1739494"


import CoreLocation

class LocationManager {
    private let locationManager: CLLocationManager = CLLocationManager()
    func a() {
        // точность опеределения
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        locationManager.startUpdatingLocation()
        //locationManager.delegate = self
    }
    
}

