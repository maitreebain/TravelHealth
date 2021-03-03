//
//  CovidModel.swift
//  TravelHealth
//
//  Created by Maitree Bain on 2/3/21.
//  Copyright © 2021 Maitree Bain. All rights reserved.
//

import Foundation

struct CovidData: Decodable, Equatable {
    let countries: [Countries]
    //string but need to convert to date type, use computed property
    
    enum CodingKeys: String, CodingKey {
        case countries = "Countries"
    }
}

struct Countries: Decodable, Equatable {
    let country: String
    let newConfirmed: Int
    let totalConfirmed: Int
    let totalDeaths: Int
    let totalRecovered: Int
    let date: String
    
    enum CodingKeys: String, CodingKey {
        case country = "Country"
        case newConfirmed = "NewConfirmed"
        case totalConfirmed = "TotalConfirmed"
        case totalDeaths = "TotalDeaths"
        case totalRecovered = "TotalRecovered"
        case date = "Date"
    }
}
