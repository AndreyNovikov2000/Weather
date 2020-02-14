//
//  Constant.swift
//  Weather
//
//  Created by Andrey Novikov on 2/3/20.
//  Copyright © 2020 Andrey Novikov. All rights reserved.
//

import UIKit

struct Constants {
    static let leftDistanceToView: CGFloat = 30
    static let rightDistanceToView: CGFloat = 30
    static let minimumSpacing: CGFloat = 20
    static let cellsWidth: CGFloat = (UIScreen.main.bounds.width -
        Constants.leftDistanceToView -
        Constants.rightDistanceToView -
        (Constants.minimumSpacing / 4)) / 5
}
