//
//  Helper.swift
//  Weather
//
//  Created by Andrey Novikov on 1/26/20.
//  Copyright © 2020 Andrey Novikov. All rights reserved.
//

/*

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
 
 
 struct OpenWeatherMap {
 let nameCity: String
 let temp: Double
 let description: String
 let currentTime: Int
 let icon: String
 
 var delegate: OpenWeatherMapDelegate!
 
 init(weatherJson: NSDictionary) {
     nameCity = weatherJson["name"] as? String ?? ""
     
     let mainWeatherJSON = weatherJson["main"] as? [String: AnyObject]
     temp = mainWeatherJSON?["temp"] as? Double ?? 1.0
     
     let weather = weatherJson["weather"] as? [[String: AnyObject]]
     let firstIndexOfWeather = weather?[0]
     description = firstIndexOfWeather?["description"] as? String ?? ""
     
     currentTime = weatherJson["dt"] as? Int ?? 0
     
     icon = firstIndexOfWeather?["icon"] as? String ?? ""
 }

 */


// MARK: - Final URL and request

/*
let url = "https://api.openweathermap.org/data/2.5/weather?q=Almaty,forecast?id=524901&appid=5ad2283b07a684c9b4541b10d1739494"
override func viewDidLoad() {
    super.viewDidLoad()
    
   
    URLSession.shared.dataTask(with: URL(string: url)!) { (data, response, error) in
        if let error = error {
            print(error)
        }
    
        
        let JSON = try! JSONSerialization.jsonObject(with: data!, options: [])
        let dictionaryJSON = JSON as! NSDictionary
        
        if let cityName = dictionaryJSON["name"] as? String {
            print("city -> ", cityName)
        }
        
        if let weather = dictionaryJSON["weather"] as? [[String: AnyObject]] {
            if let main = weather[0]["main"] as? String {
                print("main -> ", main)
            }
        }
    }.resume()
*/

/*
 
 "https://api.openweathermap.org/data/2.5/weather?q=Almaty,forecast?id=524901&appid=5ad2283b07a684c9b4541b10d1739494"
 
 */
