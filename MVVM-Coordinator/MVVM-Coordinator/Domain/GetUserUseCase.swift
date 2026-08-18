//
//  GetUserUseCase.swift
//  MVVM-Coordinator
//
//  Created by Sachin Daingade on 18/08/26.
//

protocol GetUserUseCase {
    func execute() async throws -> User
}


