//
//  WeatherCollectionView.swift
//  Weather
//
//  Created by Andrey Novikov on 2/3/20.
//  Copyright © 2020 Andrey Novikov. All rights reserved.
//

import UIKit

class WeatherCollectionView: UICollectionView {
    
    // MARK: - Private Properties
    private let urlString = "https://api.openweathermap.org/data/2.5/forecast?q=Almaty&appid=5ad2283b07a684c9b4541b10d1739494"
    private let networkFetcher = NetworkFetcher()
    private var weatherList: MainList?
    
    // MARK: - Init
    init() {
        let layout = UICollectionViewFlowLayout()
        super.init(frame: .zero, collectionViewLayout: layout)
        
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = Constants.minimumSpacing
        
        setupWeatherCollectionView()
        
        
        networkFetcher.fetcDataForFiveDays(urlString: urlString) { [unowned self] list in
            self.weatherList = list
            DispatchQueue.main.sync {
                 self.reloadData()
            }
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    private func setupWeatherCollectionView() {
        delegate = self
        dataSource = self
        showsHorizontalScrollIndicator = false
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .clear
        contentInset = UIEdgeInsets(top: 0, left: Constants.leftDistanceToView, bottom: 0, right: Constants.rightDistanceToView)
        register(UINib(nibName: "WeatherCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: WeatherCollectionViewCell.reusedID)
    }
}


// MARK: - UICollectionViewDataSource
extension WeatherCollectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        guard let weatherList = weatherList else { return 0 }
        return weatherList.list.count / 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = dequeueReusableCell(withReuseIdentifier: WeatherCollectionViewCell.reusedID, for: indexPath) as! WeatherCollectionViewCell
        
        guard let item = weatherList else { return UICollectionViewCell() }
        
        cell.timeLabel.text = getTimeFromUnix(unixTime: item.list[indexPath.item].dt)
        cell.weatherIconImageView.image = getWetherIcon(condition: item.list[indexPath.item].weather[0].id,
                                                        nightTime: getCurrentTime(sunrise: item.city.sunrise, sunset: item.city.sunset))
        
        return cell
    }
}


// MARK: - UICollectionViewDelegate
extension WeatherCollectionView: UICollectionViewDelegate {
    
}


// MARK: - UICollectionViewDelegateFlowLayout
extension WeatherCollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        CGSize(width: Constants.cellsWidth, height: frame.height * 0.9)
    }
}


// MARK: Private Methods for update UI
extension WeatherCollectionView {
    
    // CONVERTE TIME FROM UINIX
    func getTimeFromUnix(unixTime: Int) -> String {
         let timeInSecond = TimeInterval(unixTime)
         let weatherDate = Date(timeIntervalSince1970: timeInSecond)
         let dateFormatter = DateFormatter()
         dateFormatter.dateFormat = "HH:mm"
         
         return dateFormatter.string(from: weatherDate)
     }
    
    
    // GET TEMPERATURE
    func convertableTemperature(country: String?, temperature: Double) -> String {
        if country == "US" {
            return  String(format: "%.0f", temperature * 1.8 - 459.67) + "°F"
        } else {
            return String(format: "%.0f", temperature - 275.15) + "°C"
        }
    }
    
    
    // GET WEATHER ICON
    func getWetherIcon(condition: Int, nightTime: Bool) -> UIImage {
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
    func getCurrentTime(sunrise: Int, sunset: Int) -> Bool {
        var nightTime = false
        let nowTime = Date().timeIntervalSince1970
        
        if Int(nowTime) < sunrise || Int(nowTime) > sunset {
            nightTime = true
        }
        
        return nightTime
    }
}
