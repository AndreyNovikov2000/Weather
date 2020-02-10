//
//  WeatherTableView.swift
//  Weather
//
//  Created by Andrey Novikov on 2/10/20.
//  Copyright © 2020 Andrey Novikov. All rights reserved.
//

import UIKit

class WeatherTableView: UITableView {
    
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
extension WeatherTableView: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: WeatherTableViewCell.reuseID, for: indexPath)
        
        return cell
    }
}

// MARK: - UITableViewDelegate
extension WeatherTableView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(indexPath.row)
    }
}


