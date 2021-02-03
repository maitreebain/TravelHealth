//
//  LogInViewController.swift
//  TravelHealth
//
//  Created by Maitree Bain on 1/25/21.
//  Copyright © 2021 Maitree Bain. All rights reserved.
//

import UIKit
import FirebaseAuth

enum AccountState {
    case existingUser
    case newUser
}

class LogInViewController: UIViewController {
    
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordTextfield: UITextField!
    @IBOutlet var signInButton: UIButton!
    @IBOutlet var promptLabel: UILabel!
    
    private var account: AccountState = .existingUser
    
    override func viewDidLoad() {
        super.viewDidLoad()

        emailTextField.delegate = self
        passwordTextfield.delegate = self
    }
    
    @IBAction func loginButtonPressed(_ sender: UIButton) {
        guard let email = emailTextField.text, !email.isEmpty, let password = passwordTextfield.text, !password.isEmpty else {
            //show Alert here
            print("field empty")
            return
        }
        
//        switch account {
//        case .existingUser:
//            
//        case .newUser:
//            
//        }
        
    }
    
    
}

extension LogInViewController: UITextFieldDelegate {
    
    
}


extension LogInViewController {
    //navigate to views here
}
