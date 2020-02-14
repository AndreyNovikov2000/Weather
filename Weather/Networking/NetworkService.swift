//
//  NetworkService.swift
//  Weather
//
//  Created by Andrey Novikov on 1/26/20.
//  Copyright © 2020 Andrey Novikov. All rights reserved.
//

import Foundation

class NetworkService {
    
    func request(url: URL, complition: @escaping ((Data?, Error?) -> Void)) {
            
        URLSession.shared.dataTask(with: url) { (data, _, error) in
            if let error = error {
                print(error.localizedDescription)
                complition(nil, error)
                return
            }
            
            guard let data = data else { return }
            complition(data, nil)
            
        }.resume()
    }
}
