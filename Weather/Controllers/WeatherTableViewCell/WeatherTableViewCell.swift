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
    
    let dayLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 17)
        label.textColor = #colorLiteral(red: 0.1554902494, green: 0.1960511804, blue: 0.372797966, alpha: 1)
        return label
    }()
    
    let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    
    //
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
        addSubview(iconImageView)
        iconImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30).isActive = true
        iconImageView.topAnchor.constraint(equalTo: dayLabel.bottomAnchor, constant: 10).isActive = true
        iconImageView.widthAnchor.constraint(equalToConstant: 17).isActive = true
        iconImageView.heightAnchor.constraint(equalToConstant: 17).isActive = true
    }
}
