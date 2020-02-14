//
//  DetailViewController.swift
//  Weather
//
//  Created by Andrey Novikov on 2/8/20.
//  Copyright © 2020 Andrey Novikov. All rights reserved.
//

import UIKit

class DetailWeatherViewController: UIViewController {
    
    // MARK: -  @IBOutlets
    @IBOutlet weak var informationView: UIView!
    
    // MARK: - Private Properties
    let weatherTableView = DetailWeatherTableView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor =  UIColor(red: 0.9509845376, green: 0.985106647, blue: 1, alpha: 1)
    
        setupInformationView()
        setupWeatherTableView()
    }
    
    private func setupInformationView() {
        informationView.backgroundColor = .white
        informationView.layer.shadowColor = UIColor.gray.cgColor
        informationView.layer.shadowOpacity = 2
        informationView.layer.shadowRadius = 5
        informationView.layer.shadowOffset = CGSize.zero
        informationView.layer.cornerRadius = 20
    }
    
    private func setupWeatherTableView() {
        view.addSubview(weatherTableView)
        
        weatherTableView.topAnchor.constraint(equalTo: informationView.bottomAnchor, constant: 50).isActive = true
        weatherTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        weatherTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        weatherTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -40).isActive = true
    }
}
