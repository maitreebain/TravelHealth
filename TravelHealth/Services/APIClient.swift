//
//  PlacesAPIClient.swift
//  TravelHealth
//
//  Created by Maitree Bain on 2/11/21.
//  Copyright © 2021 Maitree Bain. All rights reserved.
//

import Foundation

struct APIClient {
    let getPlaces: (@escaping (Result <[Place], Error>) -> Void) -> Void
    let fetchCOVID: (@escaping (Result<CovidData, Error>) -> Void) -> Void
}

//refactor to use generic urlsession class
extension APIClient {
    static let live = APIClient(
        getPlaces: { completion in
            URLSession.shared.dataTask(with: URL(string: "https://restcountries.eu/rest/v2/")!) { data, _, error in
                DispatchQueue.main.async {
                    if let data = data {
                        do {
                            completion(.success(try JSONDecoder().decode([Place].self, from: data)))
                        } catch {
                            completion(.failure(error))
                        }
                    } else if let error = error {
                        completion(.failure(error))
                    }
                }
            }
            .resume()
        },
        fetchCOVID: { completion in
            URLSession.shared.dataTask(with: URL(string: "https://api.covid19api.com/summary")!) { data, _, error in
                if let data = data {
                    do {
                        completion(.success(try JSONDecoder().decode(CovidData.self, from: data)))
                    } catch {
                        completion(.failure(error))
                    }
                } else if let error = error {
                    completion(.failure(error))
                }
            }
            .resume()
        }
    )
    
    #if DEBUG
    static let mock = APIClient(
        getPlaces: { completion in
            completion(
                .success(
                    [
                        .init(name: "Paris", capital: "France"),
                        .init(name: "London", capital: "UK"),
                        .init(name: "Berlin", capital: "Germany"),
                    ]
                )
            )
        },
        fetchCOVID: { completion in
            completion(
                .success(
                    .init(
                        countries: [
                            .france
                        ]
                    )
                )
            )
        }
    )
    #endif
}

extension Countries {
    static let france = Countries(
        country: "France",
        newConfirmed: 1_000,
        totalConfirmed: 100_000,
        totalDeaths: 20,
        totalRecovered: 50_000,
        date: "2021-02-11T17:53:53.007Z"
    )
}
