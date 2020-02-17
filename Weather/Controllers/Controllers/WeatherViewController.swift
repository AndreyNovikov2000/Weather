//
//  WeatherViewController.swift
//  Weather
//
//  Created by Andrey Novikov on 1/25/20.
//  Copyright © 2020 Andrey Novikov. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController {
    
    // MARK: - @IBOutlets
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
    
    
    // MARK: - @IBActions
    @IBAction func nextFiveDaysButtonPressed(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(identifier: "DetailWeatherViewController") as! DetailWeatherViewController
        vc.weatherTableView.weather = weatherCollectionView.weatherList
        present(vc, animated: true, completion: nil)
    }
    
    @IBAction func searchButtonPressed(_ sender: Any) {
        searchCityWithAlertController()
    }
}

// MARK : - Private Methods
extension WeatherViewController {
    
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

    private func showInformationAlert(with title: String?, _ message: String?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
        
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
    }
    
    private func searchCityWithAlertController() {
        let alertController = UIAlertController(title: "Search city", message: "", preferredStyle: .alert)
        let cancelButton = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        let okButton = UIAlertAction(title: "Ok", style: .default) { [weak self] action in
            guard let text = alertController.textFields?.first?.text else { return }
            print(text)
            self?.updateUI(with: text)
            self?.weatherCollectionView.updateWeatherCollectionView(with: text)
        }
        
        alertController.addAction(okButton)
        alertController.addAction(cancelButton)
        
        alertController.addTextField { textField in
            textField.borderStyle = .roundedRect
            textField.textAlignment = .center
            textField.contentVerticalAlignment = .center
            textField.contentHorizontalAlignment = .center
            textField.clearButtonMode = .whileEditing
            textField.placeholder = "Search city"
        }
        
        present(alertController, animated: true, completion: nil)
    }

}

// MARK: - Fetch data methods
extension WeatherViewController {
    
    private func updateUI(with city: String) {
        
        let urlString = "https://api.openweathermap.org/data/2.5/weather?q=\(city),forecast?id=524901&appid=5ad2283b07a684c9b4541b10d1739494"
        activityIndicator.startAnimating()
        
        networkFetcher.fetcData(urlString: urlString) { (weather) in
            DispatchQueue.main.async { [unowned self] in
                guard let weather = weather else {
                    self.showInformationAlert(with: "Error", "The city does not does exist")
                    self.activityIndicator.stopAnimating()
                    return
                }
                
                self.loadDAataInUI(with: weather)
            }
        }
    }
    
    private func loadDAataInUI(with weather: OpenWeatherMap) {
        //GET MAIN UI
        iconImageView.image = UIImage.getWetherIcon(condition: weather.weather[0].id,
                                                                  nightTime: Bool.isCurrentTime(sunrise: weather.sys.sunrise,
                                                                                     sunset: weather.sys.sunset))
        
        temperatureLabel.text = String.convertableTemperature(country: weather.sys.country,temperature: weather.main.temp)
        dateLabel.text = String().getTimeFromUnix(unixTime:  weather.dt)
        cityLabel.text = weather.name
        
        //GET DETAILS UI
        sunsetLabel.text = "\(String().getTimeFromUnix(unixTime: weather.sys.sunset))"
        sunriseLabel.text = "\(String().getTimeFromUnix(unixTime: weather.sys.sunrise))"
        windLabel.text = "\(weather.wind.speed) m/s"
        humidityLabel.text = "\(weather.main.humidity) %"
    }
}

// MARK: - NetworkFetcherDelegate
extension WeatherViewController: NetworkFetcherDelegate {
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