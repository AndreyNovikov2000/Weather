//
//  List.swift
//  Weather
//
//  Created by Andrey Novikov on 2/7/20.
//  Copyright © 2020 Andrey Novikov. All rights reserved.
//

import Foundation

struct MainList: Decodable {
    let cod: String
    var list: [List]
    let city: City
}

struct List: Decodable {
    let dt: Int
    let main: Main
    let weather: [Weather]
    let dt_txt: String
}

struct City: Decodable {
    let sunrise: Int
    let sunset: Int
    let country: String
}
