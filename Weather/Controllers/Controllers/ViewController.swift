//
//  ViewController.swift
//  Weather
//
//  Created by Andrey Novikov on 1/25/20.
//  Copyright © 2020 Andrey Novikov. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var mainStackView: UIStackView!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var temperatureLabel: UILabel!
    
    
    @IBOutlet weak var sunriseLabel: UILabel!
    @IBOutlet weak var sunsetLabel: UILabel!
    @IBOutlet weak var windLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    
    
    // MARK: - Private Properties
    private let baseUrlString = "https://api.openweathermap.org/data/2.5/weather?q=,forecast?id=524901&appid=5ad2283b07a684c9b4541b10d1739494"
    private let networkFetcher = NetworkFetcher()
    
    private let activityIndicator = UIActivityIndicatorView()
    private let weatherCollectionView = WeatherCollectionView()
    
    // MARK: - Controllers Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        networkFetcher.delegate = self
        updateUI(with: "almaty")
        
        setupWeatherCollectionView()
        setupActivityIndicator()
        
    }
    
    // MARK: - ABACtions Methods
    @IBAction func findCityButtonPressed(_ sender: Any) {
        //showAlert(with: "City", "Enter title name")
    }
}

// MARK : - Private Methods
extension ViewController {
    
    //    private func showAlert(with title: String?, _ message: String?) {
    //        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
    //
    //        let cancelButton = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
    //        let okButton = UIAlertAction(title: "Ok", style: .default) { alertAction in
    //            guard let text = alert.textFields?.first?.text else { return }
    //            print(text)
    //        }
    //
    //        alert.addTextField { textField in
    //            textField.textAlignment = .center
    //            textField.contentVerticalAlignment = .center
    //            textField.contentHorizontalAlignment = .center
    //            textField.borderStyle = .roundedRect
    //            textField.placeholder = "Enter city"
    //        }
    //
    //        alert.addAction(cancelButton)
    //        alert.addAction(okButton)
    //        present(alert, animated: true, completion: nil)
    //    }
    
    private func showInformationAlert(with title: String?, _ message: String?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
}


// MARK: - Private Methods for update UI
extension ViewController {
    
    // CONVERTE TIME FROM UINIX
    func getTimeFromUnix(unixTime: Int) -> String {
        let timeInSecond = TimeInterval(unixTime)
        let weatherDate = Date(timeIntervalSince1970: timeInSecond)
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        
        return dateFormatter.string(from: weatherDate)
    }
    
    
    // GET TEMPERATURE
    private func convertableTemperature(country: String?, temperature: Double) -> String {
        if country == "US" {
            return  String(format: "%.0f", temperature * 1.8 - 459.67) + "°F"
        } else {
            return String(format: "%.0f", temperature - 275.15) + "°C"
        }
    }
    
    
    // GET UIIMAGE
    private func getWetherIcon(condition: Int, nightTime: Bool) -> UIImage {
        var imageName: String
        
        switch (condition, nightTime) {
        //Thunderstorm
        case let (c, n) where c < 300 && n == false: imageName = "11d"
        case let (c, n) where c < 300 && n == true: imageName = "11n"
            
        //Drizzle
        case let (c, n) where c < 400 && n == false: imageName = "09d"
        case let (c, n) where c < 400 && n == true: imageName = "09n"
            
        // Rain
        case let (c, n) where (c >= 500 && c <= 504) && n == false : imageName = "10d"
        case let (c, n) where (c >= 500 && c <= 504) && n == true: imageName = "10n"
        case let (c , n) where c == 511 && n == false: imageName = "13d"
        case let (c, n) where c == 511 && n == true: imageName = "13n"
        case let (c, n) where c < 600 && n == false: imageName = "09d"
        case let (c, n) where c < 600 && n == true: imageName = "09n"
            
        //Snow
        case let (c, n) where c < 700 && n == false: imageName = "13d"
        case let (c, n) where c < 700 && n == true: imageName = "13n"
            
        //Atmosphere
        case let (c, n) where c < 800 && n == false: imageName = "50d"
        case let (c, n) where c < 800 && n == true: imageName = "50n"
            
        //Clear
        case let (c, n) where c == 800 && n == false: imageName = "01d"
        case let (c, n) where c == 800 && n == true: imageName = "01n"
            
        //Clouds
        case let (c, n) where c == 801 && n == false: imageName = "02d"
        case let (c, n) where c == 801 && n == true: imageName = "02n"
        case let (c, n) where c == 802 && n == false: imageName = "03d"
        case let (c, n) where c == 802 && n == true: imageName = "03n"
        case let (c, n) where c < 900 && n == false: imageName = "04d"
        case let (c, n) where c < 900 && n == true: imageName = "04n"
        default: imageName = "none"
        }
        
        return UIImage(named: imageName) ?? UIImage()
    }
    
    
    //GET CURRENT TIME
    private func getCurrentTime(sunrise: Int, sunset: Int) -> Bool {
        var nightTime = false
        let nowTime = Date().timeIntervalSince1970
        
        if Int(nowTime) < sunrise || Int(nowTime) > sunset {
            nightTime = true
        }
        
        return nightTime
    }
}

// MARK: - Fetch data methods
extension ViewController {
    private func updateUI(with city: String) {
        
        let urlString = "https://api.openweathermap.org/data/2.5/weather?q=\(city),forecast?id=524901&appid=5ad2283b07a684c9b4541b10d1739494"
        activityIndicator.startAnimating()
        
        networkFetcher.fetcData(urlString: urlString) { (weather) in
            DispatchQueue.main.async { [unowned self] in
                guard let weather = weather else { return }
                self.loadDAataInUI(with: weather)
            }
        }
    }
    
    private func loadDAataInUI(with weather: OpenWeatherMap) {
        //GET MAIN UI
        iconImageView.image = getWetherIcon(condition: weather.weather[0].id,
                                                      nightTime: getCurrentTime(sunrise: weather.sys.sunrise,
                                                                                     sunset: weather.sys.sunset))
        temperatureLabel.text = convertableTemperature(country: weather.sys.country,temperature: weather.main.temp)
        dateLabel.text = getTimeFromUnix(unixTime: weather.dt)
        cityLabel.text = weather.name
        
        //GET DETAILS UI
        sunsetLabel.text = "\(getTimeFromUnix(unixTime: weather.sys.sunset))"
        sunriseLabel.text = "\(getTimeFromUnix(unixTime: weather.sys.sunrise))"
        windLabel.text = "\(weather.wind.speed) m/s"
        humidityLabel.text = "\(weather.main.humidity) %"
    }
}

// MARK: - NetworkFetcherDelegate
extension ViewController: NetworkFetcherDelegate {
    func networkFetcherDidSuccessRequesting() {
        print("networkFetcherDidSuccessRequesting success requesting")
        DispatchQueue.main.async {
            self.activityIndicator.stopAnimating()
        }
    }
    
    func networkFetcherDidFailedRequesting() {
        print("networkFetcherDidFailedRequesting failed requesting")
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.showInformationAlert(with: "Error", "No connecting internet")
        }
    }
}


// MARK: - SetupUI
extension ViewController {
    private func setupActivityIndicator() {
        activityIndicator.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        activityIndicator.center = view.center
        view.addSubview(activityIndicator)
    }
    
    private func setupWeatherCollectionView() {
        view.addSubview(weatherCollectionView)
        
        weatherCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        weatherCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        weatherCollectionView.topAnchor.constraint(equalTo: mainStackView.bottomAnchor, constant: 10).isActive = true
        weatherCollectionView.heightAnchor.constraint(greaterThanOrEqualToConstant: 110).isActive = true
    }
}
