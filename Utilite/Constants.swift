//
//  Constants.swift
//  Weather
//
//  Created by Andrey Novikov on 1/27/20.
//  Copyright © 2020 Andrey Novikov. All rights reserved.
//




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

