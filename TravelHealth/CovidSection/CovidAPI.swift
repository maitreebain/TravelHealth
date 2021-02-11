//
//  CovidAPI.swift
//  TravelHealth
//
//  Created by Maitree Bain on 1/12/21.
//  Copyright © 2021 Maitree Bain. All rights reserved.
//

import Foundation
import NetworkHelper

struct CovidAPIClient {
    static func fetchCOVIDAPI(completion: @escaping (Result<[Countries], AppError>) -> ()) {
        
        let endpoint = "https://api.covid19api.com/summary"
        
        guard let url = URL(string: endpoint) else {
            completion(.failure(.badURL(endpoint)))
            return
        }
        
        let request = URLRequest(url: url)
        
        NetworkHelper.shared.performDataTask(with: request) { (result) in
            switch result {
            case .failure(let appError):
                print(appError)
                //maybe do show alert here?
                completion(.failure(.networkClientError(appError)))
            case .success(let data):
                do {
                    let countries = try JSONDecoder().decode(CovidData.self, from: data)
                    completion(.success(countries.countries))
                } catch {
                    completion(.failure(.decodingError(error)))
                }
            }
        }
    }
    
}
