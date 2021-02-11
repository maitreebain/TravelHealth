//
//  ViewController.swift
//  TravelHealth
//
//  Created by Maitree Bain on 1/2/21.
//  Copyright © 2021 Maitree Bain. All rights reserved.
//

import UIKit

class ItemsViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
    }


}

extension ItemsViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "medCell", for: indexPath) as? MedCell else {
            fatalError("could not dequeue cell")
        }
        
        return cell
    }
    
    
}

extension ItemsViewController: UITableViewDelegate {
    
    
}
