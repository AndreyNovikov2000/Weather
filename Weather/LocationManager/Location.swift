//
//  Location.swift
//  Weather
//
//  Created by Andrey Novikov on 2/24/20.
//  Copyright © 2020 Andrey Novikov. All rights reserved.
//

import Foundation
import CoreLocation

class Location {
    
    // MARK: - Public properties
    let locationManager = CLLocationManager()
    
    // MARK: - Init
    init() {
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }
    
    // MARK: Public methods
    func getPlace(for location: CLLocation, complition: @escaping (CLPlacemark?) -> Void) {
         let geocoder = CLGeocoder()
         
         geocoder.reverseGeocodeLocation(location) { (placemarks, error) in
             if let error = error {
                 print("Error in \(#function): \(error.localizedDescription)")
                 complition(nil)
                 return
             }
             
             guard let placemark = placemarks?.first else {
                 print("Error \(#function): placemarkis nil")
                 return
             }
             complition(placemark)
         }
     }
}


