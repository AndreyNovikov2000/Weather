//
//  WeatherTableView.swift
//  Weather
//
//  Created by Andrey Novikov on 2/10/20.
//  Copyright © 2020 Andrey Novikov. All rights reserved.
//

import UIKit

class DetailWeatherTableView: UITableView {
    
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
        backgroundColor =  UIColor(red: 0.9509845376, green: 0.985106647, blue: 1, alpha: 1)
        tableFooterView = UIView()
        separatorStyle = .none
        delegate = self
        dataSource = self
    }
    
}

// MARK: - UITableViewDataSource
extension DetailWeatherTableView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: WeatherTableViewCell.reuseID, for: indexPath) as! WeatherTableViewCell
        
        cell.dayLabel.text = "Tue"
        cell.iconImageView.image = UIImage(named: "water")!
        
        return cell
    }
}

// MARK: - UITableViewDelegate
extension DetailWeatherTableView: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 65
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
}


