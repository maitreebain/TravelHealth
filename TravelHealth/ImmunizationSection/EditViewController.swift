//
//  EditViewController.swift
//  TravelHealth
//
//  Created by Maitree Bain on 1/25/21.
//  Copyright © 2021 Maitree Bain. All rights reserved.
//

import UIKit

class EditViewController: UIViewController {

    @IBOutlet var nameTextField: UITextField!
    @IBOutlet var doseTextField: UITextField!
    @IBOutlet var descripText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nameTextField.delegate = self
        doseTextField.delegate = self
        descripText.delegate = self
    }
    

}

extension EditViewController: UITextFieldDelegate {
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        return false
    }
}
