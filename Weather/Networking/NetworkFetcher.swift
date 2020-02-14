//
//  NetworkFetcher.swift
//  Weather
//
//  Created by Andrey Novikov on 1/26/20.
//  Copyright © 2020 Andrey Novikov. All rights reserved.
//

import Foundation

protocol NetworkFetcherDelegate {
        func networkFetcherDidSuccessRequesting()
        func networkFetcherDidFailedRequesting()
}

class NetworkFetcher {
    var delegate: NetworkFetcherDelegate!
    
    private let networkService = NetworkService()
    
    func fetcData(urlString: String, complitionHendler: @escaping ((OpenWeatherMap?) -> Void)) {
        
        guard let url = URL(string: urlString) else { return }
        
        networkService.request(url: url) { (data, error) in
            if let error = error {
                print(error.localizedDescription)
                self.delegate.networkFetcherDidFailedRequesting()
                complitionHendler(nil)
                return
            }
            
            guard let data = data else { return }
            
            do {
                let weather = try JSONDecoder().decode(OpenWeatherMap.self, from: data)
                self.delegate.networkFetcherDidSuccessRequesting()
                complitionHendler(weather)
                
            } catch let error {
                print(error.localizedDescription)
                complitionHendler(nil)
                return
            }
            
        }
    }
    
    func fetcDataForFiveDays(urlString: String, complitionHendler: @escaping ((MainList?) -> Void)) {
        
        guard let url = URL(string: urlString) else { return }
        
        networkService.request(url: url) { (data, error) in
            if let error = error {
                print(error.localizedDescription)
                complitionHendler(nil)
                return
            }
            guard let data = data else { return }
            
            do {
                let weather = try JSONDecoder().decode(MainList.self, from: data)
                complitionHendler(weather)
                
            } catch let error {
                print(error.localizedDescription)
                complitionHendler(nil)
                return
            }
            
        }
    }
    
//    func fetchDataWithObject<T>(urlString: String, complitionHeandler: @escaping ((T?) -> Void)) -> Void where T: OpenWeatherMap {
//        guard let url = URL(string: urlString) else { return }
//
//        networkService.request(url: url) { (data, error) in
//            if let error = error {
//                print(error.localizedDescription)
//                complitionHeandler(nil)
//                return
//            }
//
//            guard let data = data else { return }
//
//            do {
//                let weather = try JSONDecoder().decode(T.self, from: data)
//                complitionHeandler(weather)
//
//            } catch let error {
//                print(error.localizedDescription)
//            }
//        }
//    }
}
