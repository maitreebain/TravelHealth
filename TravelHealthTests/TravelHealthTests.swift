//
//  TravelHealthTests.swift
//  TravelHealthTests
//
//  Created by Maitree Bain on 1/2/21.
//  Copyright © 2021 Maitree Bain. All rights reserved.
//

import XCTest
@testable import TravelHealth

class TravelHealthTests: XCTestCase {
    
    /*
     -Test
     - API/callbacks
     -
     */
    
    func testDataViewModel() {
        apiClient = .mock
        let dataViewModel = DataViewModel()
        var isIndicatorHidden = [Bool]()
        var reloadData = [Void]()
        dataViewModel.isIndiciatorHidden = {
            isIndicatorHidden.append($0)
        }
        dataViewModel.reloadData = {
            reloadData.append(())
        }
        
        dataViewModel.viewDidLoad()
        XCTAssertEqual(isIndicatorHidden, [false])
        XCTWaiter.init().wait(for: [.init()], timeout: 0.1)
        XCTAssertEqual(isIndicatorHidden, [false,true])
        
        XCTAssertEqual(dataViewModel.items, CovidData(countries: [.france]))
    }
    
    func testCovidAPIClient() {
        apiClient = .mock
        
    }
    
    func testPlacesAPIClient() {
        
    }
    


}
