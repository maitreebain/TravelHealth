//
//  AuthenticationService.swift
//  TravelHealth
//
//  Created by Maitree Bain on 2/3/21.
//  Copyright © 2021 Maitree Bain. All rights reserved.
//

import Foundation
import FirebaseAuth

class AuthenticationSession {
  public func createNewUser(email: String, password: String, completion: @escaping (Result<AuthDataResult, Error>) ->()){
    Auth.auth().createUser(withEmail: email, password: password) { (authDataResult, error) in
      if let error = error {
        completion(.failure(error))
      } else if let authDataResult = authDataResult {
        completion(.success(authDataResult))
      }
    }
  }
    
  public func signExistingUser(email: String, password: String, completion: @escaping (Result<AuthDataResult, Error>) ->()) {
    Auth.auth().signIn(withEmail: email, password: password) {
      (authDataResult, error) in
      if let error = error {
        completion(.failure(error))
      } else if let authDataResult = authDataResult {
        completion(.success(authDataResult))
      }
    }
  }
}

