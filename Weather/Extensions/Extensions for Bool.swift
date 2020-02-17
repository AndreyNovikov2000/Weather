//
//  Extensions for Bool.swift
//  Weather
//
//  Created by Andrey Novikov on 2/18/20.
//  Copyright © 2020 Andrey Novikov. All rights reserved.
//

import Foundation


// MARK: - IS CURRENT TIME
extension Bool {
    static func isCurrentTime(sunrise: Int, sunset: Int) -> Bool {
        var nightTime = false
        let nowTime = Date().timeIntervalSince1970
        
        if Int(nowTime) < sunrise || Int(nowTime) > sunset {
            nightTime = true
        }
        
        return nightTime
    }
}
