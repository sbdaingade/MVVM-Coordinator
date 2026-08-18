//
//  UserRepository.swift
//  MVVM-Coordinator
//
//  Created by Sachin Daingade on 18/08/26.
//

protocol UserRepository {
    func getUser() async throws -> User
}
