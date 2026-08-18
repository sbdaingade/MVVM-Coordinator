//
//  APIClient.swift
//  MVVM-Coordinator
//
//  Created by Sachin Daingade on 18/08/26.
//

import Combine

protocol APIClient {
    func fetchUser() async throws -> User
}

final class APIClientImplementation: APIClient {
    func fetchUser() async throws -> User {
        return User(id: 1, name: "sachin", username: "sachindaingade", email: "sbdaingade", phone: "9422129695")
    }
}
