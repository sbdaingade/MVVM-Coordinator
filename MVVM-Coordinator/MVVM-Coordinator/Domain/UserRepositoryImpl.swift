//
//  UserRepositoryImpl.swift
//  MVVM-Coordinator
//
//  Created by Sachin Daingade on 18/08/26.
//

import Foundation
import Combine

//final class UserRepositoryImpl: UserRepository {
//
//    private let apiClient: APIClient
//
//    init(apiClient: APIClient) {
//        self.apiClient = apiClient
//    }
//
//    func getUser() async throws -> UserDetails {
//        try await apiClient.fetchUser()
//    }
//}


final class UserRepositoryImpl: UserRepository {

    private let apiClient: LoginAPIClient

    init(apiClient: LoginAPIClient) {
        self.apiClient = apiClient
    }

    func login(  email: String,  password: String) -> AnyPublisher<UserDetails, NSError> {
        return apiClient.login( email: email, password: password)
       
    }
}
