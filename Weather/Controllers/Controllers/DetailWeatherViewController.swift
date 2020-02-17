//
//  DetailViewController.swift
//  Weather
//
//  Created by Andrey Novikov on 2/8/20.
//  Copyright © 2020 Andrey Novikov. All rights reserved.
//

import UIKit

class DetailWeatherViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var netxFiveDaysLabel: UILabel!
    
    // MARK: - Private Properties
    let weatherTableView = DetailWeatherTableView()
    
    // MARK: Live Cycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor =  UIColor(red: 0.9509845376, green: 0.985106647, blue: 1, alpha: 1)
    
        setupWeatherTableView()
        setupUIForTableView()
    }
    
    // MARK: Private Methods
    private func setupWeatherTableView() {
        view.addSubview(weatherTableView)
        
        weatherTableView.topAnchor.constraint(equalTo: netxFiveDaysLabel.bottomAnchor, constant: 20).isActive = true
        weatherTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        weatherTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        weatherTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true
    }
    
    private func setupUIForTableView() {
        weatherTableView.tableFooterView = UIView()
        weatherTableView.separatorStyle = .none
        weatherTableView.backgroundColor =  UIColor(red: 0.9509845376, green: 0.985106647, blue: 1, alpha: 1)
    }
}
