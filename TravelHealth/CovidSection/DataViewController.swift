//
//  DataViewController.swift
//  TravelHealth
//
//  Created by Maitree Bain on 2/19/21.
//  Copyright © 2021 Maitree Bain. All rights reserved.
//

import UIKit

class DataViewController: UITableViewController {
    //initialize controller?
    
    let apiClient: APIClient
    
    var items: CovidData?
    
    init(apiClient: APIClient = .live) {
        self.apiClient = apiClient
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        apiClient.fetchCOVID { result in
            
            switch result {
            case .success(let items):
                DispatchQueue.main.async {
                    self.items = items
                    self.tableView.reloadData()
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    self.showAlert(title: "Error", message: "\(error)")
                }
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items?.countries.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "dataCell", for: indexPath)
        
        cell.textLabel?.text = items?.countries[indexPath.row].country
        
        return cell
    }
    
}
