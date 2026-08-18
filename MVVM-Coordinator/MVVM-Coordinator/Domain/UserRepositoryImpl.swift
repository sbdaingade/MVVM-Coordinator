//
//  UserRepositoryImpl.swift
//  MVVM-Coordinator
//
//  Created by Sachin Daingade on 18/08/26.
//

import Foundation

final class UserRepositoryImpl: UserRepository {

    private let apiClient: APIClient

    init(apiClient: APIClient) {
        self.apiClient = apiClient
    }

    func getUser() async throws -> User {
        try await apiClient.fetchUser()
    }
}

