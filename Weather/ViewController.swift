//
//  ViewController.swift
//  Weather
//
//  Created by Andrey Novikov on 1/25/20.
//  Copyright © 2020 Andrey Novikov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    private let url = "https://samples.openweathermap.org/data/2.5/weather?q=London,uk&appid=b6907d289e10d714a6e88b30761fae22"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let urlString = URL(string: url)!
        
        let session = URLSession.shared
        session.downloadTask(with: urlString) { (location, response, error) in
            if let error = error {
                print(error.localizedDescription)
            }
            
            let weatherData = try! Data.init(contentsOf: urlString)
            let weatherJSON = try! JSONSerialization.jsonObject(with: weatherData, options: [])
            let jsonDictinary = weatherJSON as! NSDictionary
            
            let weather = OpenWeatherMap(weatherJson: jsonDictinary)
            print("let nameCity = ", weather.nameCity)
            print("let temp = ", weather.temp)
            print("let description = ", weather.description)
            print("let currentTime =", weather.currentTime)
            print("let icon = ", weather.icon)
            
            DispatchQueue.main.async {
                self.imageView.image = weather.getWetherIcon(stringIcon: weather.icon)
            }
            
            
        }.resume()
    }
}

