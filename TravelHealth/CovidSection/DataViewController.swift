//
//  DataViewController.swift
//  TravelHealth
//
//  Created by Maitree Bain on 2/19/21.
//  Copyright © 2021 Maitree Bain. All rights reserved.
//

import UIKit

class DataViewModel {
    
    //outputs
    var reloadData: (() -> Void) = { }
    var items: CovidData?
    var isIndiciatorHidden: ((Bool) -> Void) = { _ in }
    
    //inputs
    func viewDidLoad() {
        isIndiciatorHidden(false)
        apiClient.fetchCOVID { result in
            DispatchQueue.main.async {
                self.isIndiciatorHidden(true)
                
                switch result {
                case .success(let items):
                    self.items = items
                    self.reloadData()
                    
                case .failure(let error):
                    break
                //                DispatchQueue.main.async {
                //                    self.showAlert(title: "Error", message: "\(error)")
                //                }
                }
            }
        }
    }
    
}

class DataViewController: UITableViewController {
    //initialize controller?
    
    let dataViewModel = DataViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let indicator = UIActivityIndicatorView(style: .large)
        self.view.addSubview(indicator)
        indicator.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            indicator.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            indicator.centerYAnchor.constraint(equalTo: self.view.centerYAnchor)
        ])
        indicator.startAnimating()
        
        dataViewModel.reloadData = {
            self.tableView.reloadData()
        }
        dataViewModel.isIndiciatorHidden = { bool in
            indicator.isHidden = bool
        }
        dataViewModel.viewDidLoad()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataViewModel.items?.countries.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "dataCell", for: indexPath)
        
        cell.textLabel?.text = dataViewModel.items?.countries[indexPath.row].country
        
        return cell
    }
    
}
