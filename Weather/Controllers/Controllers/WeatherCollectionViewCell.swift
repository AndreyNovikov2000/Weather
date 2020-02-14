//
//  WetherCollectionViewCell.swift
//  Weather
//
//  Created by Andrey Novikov on 2/3/20.
//  Copyright © 2020 Andrey Novikov. All rights reserved.
//

import UIKit

class WeatherCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var backgroundImageView: UIImageView!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var weatherIconImageView: UIImageView!
    
    static let reusedID = "WetherCollectionViewCell"
}
