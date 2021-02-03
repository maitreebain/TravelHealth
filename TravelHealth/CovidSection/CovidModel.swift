//
//  CovidModel.swift
//  TravelHealth
//
//  Created by Maitree Bain on 2/3/21.
//  Copyright © 2021 Maitree Bain. All rights reserved.
//

import Foundation

struct CovidData {
    let country: String
    let newConfirmed: Int
    let totalConfirmed: Int
    let totalDeaths: Int
    let totalRecovered: Int
    let date: String
    //string but need to convert to date type, use computed property
}
