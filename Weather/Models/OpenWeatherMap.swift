//
//  OpenWeatherMap.swift
//  Weather
//
//  Created by Andrey Novikov on 1/25/20.
//  Copyright © 2020 Andrey Novikov. All rights reserved.
//

struct OpenWeatherMap: Decodable {
    let name: String
    let main: Main
    let wind: Wind
    let weather: [Weather]
    let dt: Int
    let sys: Sys
}

struct Main: Decodable {
    let temp: Double
    let humidity: Int
}

struct Wind: Decodable {
    let speed: Double
}

struct Weather: Decodable {
    let description: String
    let id: Int
    let icon: String
}

struct Sys: Decodable {
    let country: String
    let sunrise: Int
    let sunset: Int
}
