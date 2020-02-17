//
//  WeatherTableView.swift
//  Weather
//
//  Created by Andrey Novikov on 2/10/20.
//  Copyright © 2020 Andrey Novikov. All rights reserved.
//

import UIKit

class DetailWeatherTableView: UITableView {
    
    // MARK: - Public Properties
    var weather: MainList?
    
    // MARK: - Init
    init() {
        super.init(frame: .zero, style: .plain)
        setupTableView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    private func setupTableView() {
        register(WeatherTableViewCell.self, forCellReuseIdentifier: WeatherTableViewCell.reuseID)
        translatesAutoresizingMaskIntoConstraints = false
        showsVerticalScrollIndicator = false
        delegate = self
        dataSource = self
    }
}

// MARK: - UITableViewDataSource
extension DetailWeatherTableView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        guard let count = weather?.list.count else { return 0 }
        return count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: WeatherTableViewCell.reuseID, for: indexPath) as! WeatherTableViewCell
        
        guard let item = weather else { return WeatherTableViewCell() }
        
        cell.humidityLabel.text = "\(item.list[indexPath.row].main.humidity)%"
        cell.dayLabel.text = String(item.list[indexPath.row].dt_txt).getDate()
        cell.timeLabel.text = String(item.list[indexPath.row].dt_txt).getTime()
        
        
        cell.iconImageView.image = UIImage.getWetherIcon(condition: item.list[indexPath.row].weather[0].id,
                                                 nightTime: Bool.isCurrentTime(sunrise: item.city.sunrise, sunset: item.city.sunset))
        
        cell.temperatureLabel.text = String.convertableTemperature(country: item.city.country,
                                                            temperature: item.list[indexPath.row].main.temp)
        
        return cell
    }
}

// MARK: - UITableViewDelegate
extension DetailWeatherTableView: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 65
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        deselectRow(at: indexPath, animated: true)
        print(indexPath.row)
    }
}




