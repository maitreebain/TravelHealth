//
//  PlacesViewController.swift
//  TravelHealth
//
//  Created by Maitree Bain on 1/25/21.
//  Copyright © 2021 Maitree Bain. All rights reserved.
//

import UIKit

class PlacesViewModel {
    
    var reloadData: (() -> Void) = { }
    
    //outputs
    var places = [Place]()
    
    //inputs
    func viewInfo() {
        
            apiClient.getPlaces { result in
                switch result {
                case .failure(let error):
                    print("\(error)")
                case .success(let places):
                    DispatchQueue.main.async {
                    self.places = places
                    self.reloadData()
                }
            }
            
        }
        
    }
    
}

class PlacesViewController: UIViewController {
    
    let placesViewModel = PlacesViewModel()
    
    @IBOutlet var placesPicker: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        placesPicker.dataSource = self
        placesPicker.delegate = self
        
        placesViewModel.reloadData = {
            self.placesPicker.reloadAllComponents()
        }
        
        placesViewModel.viewInfo()
    }
    
    
}

extension PlacesViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        //get from places array.count
        return placesViewModel.places.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return placesViewModel.places[row].name
    }
    
    
}
