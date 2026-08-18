//
//  GetUserUserCaseImpl.swift
//  MVVM-Coordinator
//
//  Created by Sachin Daingade on 18/08/26.
//

final class GetUserUseCaseImpl: GetUserUseCase {

    private let repository: UserRepository

    init(repository: UserRepository) {
        self.repository = repository
    }

    func execute() async throws -> User {
        try await repository.getUser()
    }
}
