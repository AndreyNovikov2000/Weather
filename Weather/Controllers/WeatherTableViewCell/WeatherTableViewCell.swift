//
//  WeatherTableViewCell.swift
//  Weather
//
//  Created by Andrey Novikov on 2/10/20.
//  Copyright © 2020 Andrey Novikov. All rights reserved.
//

import UIKit

class WeatherTableViewCell: UITableViewCell {
    
    // MARK: - Static Properies
    static let reuseID = "WeatherTableViewCell"
    
    // MARK: - UI
    let dayLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.textColor = UIColor(red: 0.1554902494, green: 0.1960511804, blue: 0.372797966, alpha: 1)
        return label
    }()
    
    let humidityIconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.image = UIImage(named: "water")!
        return imageView
    }()
    
    let humidityLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textColor = UIColor(red: 0.1554902494, green: 0.1960511804, blue: 0.372797966, alpha: 1)
        return label
    }()
    
    let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    let temperatureLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 19)
        label.textColor = UIColor(red: 0.1554902494, green: 0.1960511804, blue: 0.372797966, alpha: 1)
        return label
    }()
    
    let timeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.textColor = UIColor(red: 0.1554902494, green: 0.1960511804, blue: 0.372797966, alpha: 1)
        return label
    }()

    // MARK: - Live Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    // MARK: - Init
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = UIColor(red: 0.9509845376, green: 0.985106647, blue: 1, alpha: 1)
        
        setupConstraintsForDaylabel()
        setupConstraintsForIconImageView()
        setupConstraintsForHumidityLabel()
        setupConstraintsForTemperatureLabel()
        setupConstraintForIconImageview()
        setupConstraintsForTimeLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Private Methods
    private func setupConstraintsForDaylabel() {
        addSubview(dayLabel)
        
        dayLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30).isActive = true
        dayLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5).isActive = true
    }
    
    private func setupConstraintsForIconImageView() {
        addSubview(humidityIconImageView)
        humidityIconImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30).isActive = true
        humidityIconImageView.topAnchor.constraint(equalTo: dayLabel.bottomAnchor, constant: 10).isActive = true
        humidityIconImageView.widthAnchor.constraint(equalToConstant: 14).isActive = true
        humidityIconImageView.heightAnchor.constraint(equalToConstant: 14).isActive = true
    }
    
    private func setupConstraintsForHumidityLabel() {
        addSubview(humidityLabel)
        humidityLabel.leadingAnchor.constraint(equalTo: humidityIconImageView.leadingAnchor, constant: 18).isActive = true
        humidityLabel.topAnchor.constraint(equalTo: dayLabel.bottomAnchor, constant: 9).isActive = true
    }
    
    private func setupConstraintsForTemperatureLabel() {
        addSubview(temperatureLabel)
        temperatureLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40).isActive = true
        temperatureLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
    }
    
    private func setupConstraintForIconImageview() {
        addSubview(iconImageView)
        iconImageView.trailingAnchor.constraint(equalTo: temperatureLabel.trailingAnchor, constant: -50).isActive = true
        iconImageView.topAnchor.constraint(equalTo: topAnchor, constant: 7).isActive = true
        iconImageView.widthAnchor.constraint(equalToConstant: 51).isActive = true
        iconImageView.heightAnchor.constraint(equalToConstant: 51).isActive = true
    }
    
    private func setupConstraintsForTimeLabel() {
        addSubview(timeLabel)
        timeLabel.leadingAnchor.constraint(equalTo: dayLabel.trailingAnchor, constant: 20).isActive = true
        timeLabel.topAnchor.constraint(equalTo: topAnchor, constant: 5).isActive = true
    }
}
