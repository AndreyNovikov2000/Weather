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
    
    @IBAction func findCityButtonPressed(_ sender: Any) {
        showAlert(with: "City", "Enter title name")
    }
    
    
}

// MARK : - Private Methods
extension ViewController {
    private func showAlert(with title: String?, _ message: String?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        let cancelButton = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let okButton = UIAlertAction(title: "Ok", style: .default) { alertAction in
            if let textField = alert.textFields?.first {
                self.getWeatherForCity(city: textField.text ?? "")
            }
        }
        
        alert.addTextField { textField in
            textField.textAlignment = .center
            textField.contentVerticalAlignment = .center
            textField.contentHorizontalAlignment = .center
            textField.borderStyle = .roundedRect
            textField.placeholder = "Enter city"
        }
        
        alert.addAction(cancelButton)
        alert.addAction(okButton)
        present(alert, animated: true, completion: nil)
    }
    
    private func getWeatherForCity(city: String) {
        print(city)
    }
}
