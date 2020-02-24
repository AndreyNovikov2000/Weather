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
    
    // MARK: - Public Properties
    var weatherList: MainList?
    
    // MARK: - Init
    init() {
        let layout = UICollectionViewFlowLayout()
        super.init(frame: .zero, collectionViewLayout: layout)
        
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = Constants.minimumSpacing
        
        setupWeatherCollectionView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    // MARK: - Public Methods
    func updateWeatherCollectionView(with city: String) {
        let urlString = "https://api.openweathermap.org/data/2.5/forecast?q=\(city)&appid=5ad2283b07a684c9b4541b10d1739494"
        networkFetcher.fetcDataForFiveDays(urlString: urlString) { [unowned self] list in
            guard let list = list else { return }
            self.weatherList = list
            DispatchQueue.main.sync {
                self.reloadData()
            }
        }
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
        
        guard let item = weatherList else { return WeatherCollectionViewCell() }
        
        cell.timeLabel.text = String().getTimeFromUnix(unixTime: item.list[indexPath.item].dt)
        cell.weatherIconImageView.image = UIImage.getWetherIcon(condition: item.list[indexPath.item].weather[0].id,
                                                        nightTime: Bool.isCurrentTime(sunrise: item.city.sunrise, sunset: item.city.sunset))
        
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
