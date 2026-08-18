//
//  UserRepository.swift
//  MVVM-Coordinator
//
//  Created by Sachin Daingade on 18/08/26.
//

import Combine
import Foundation

protocol UserRepository {
    func login( email: String, password: String) -> AnyPublisher<UserDetails, NSError>
}

