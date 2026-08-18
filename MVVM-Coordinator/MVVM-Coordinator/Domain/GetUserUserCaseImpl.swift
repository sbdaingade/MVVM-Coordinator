//
//  GetUserUserCaseImpl.swift
//  MVVM-Coordinator
//
//  Created by Sachin Daingade on 18/08/26.
//

//final class GetUserUseCaseImpl: GetUserUseCase {
//
//    private let repository: UserRepository
//
//    init(repository: UserRepository) {
//        self.repository = repository
//    }
//
//    func execute() async throws -> UserDetails {
//        try await repository.getUser()
//    }
//}

import Combine
import Foundation

final class LoginUseCaseImpl: LoginUseCase {

    private let repository: UserRepository

    init(repository: UserRepository) {
        self.repository = repository
    }

    func execute(email: String,password: String) -> AnyPublisher<UserDetails, NSError> {
        repository.login(email: email, password: password)
    }
}
