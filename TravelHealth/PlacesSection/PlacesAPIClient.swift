//
//  PlacesAPIClient.swift
//  TravelHealth
//
//  Created by Maitree Bain on 2/11/21.
//  Copyright © 2021 Maitree Bain. All rights reserved.
//

import Foundation
import NetworkHelper

struct PlacesAPIClient {
    static func getPlaces(completion: @escaping (Result <[Place], AppError>) -> ()) {
        
        let endpoint = "https://restcountries.eu/rest/v2/"
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
                    let place = try JSONDecoder().decode([Place].self, from: data)
                    //only gets one place
                    completion(.success(place))
                } catch {
                    completion(.failure(.decodingError(error)))
                }
            }
        }
    }
}
