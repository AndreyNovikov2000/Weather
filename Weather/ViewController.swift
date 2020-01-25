//
//  ViewController.swift
//  Weather
//
//  Created by Andrey Novikov on 1/25/20.
//  Copyright © 2020 Andrey Novikov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let url = "https://samples.openweathermap.org/data/2.5/weather?q=London,uk&appid=b6907d289e10d714a6e88b30761fae22"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let urlString = URL(string: url)!
        let data = try! Data.init(contentsOf: urlString)
        print(data)
        
        let session = URLSession.shared
        //Async thread in main
        session.downloadTask(with: urlString) { (location, response, error) in
            if let error = error {
                print(error)
            }
            
            let weatherData = try! Data.init(contentsOf: urlString)
            let weatherJSON = try! JSONSerialization.jsonObject(with: weatherData, options: [])
            let jsonDictinary = weatherJSON as! NSDictionary
            print(jsonDictinary)
            
            let weather = OpenWeatherMap(weatherJson: jsonDictinary)
            print("let nameCity = ", weather.nameCity)
            print("let temp = ", weather.temp)
            
            
            if let cityName = jsonDictinary["name"] as? String {
                print("CITY:  ",cityName)
            }
            
            if let main = jsonDictinary["main"] as? [String: AnyObject] {
                if let temp = main["temp"] as? Double {
                    print("TEMP: ", temp)
                }
            }
            
            
           
            
        }.resume()
    }
}

