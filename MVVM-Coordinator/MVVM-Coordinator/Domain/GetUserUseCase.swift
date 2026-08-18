//
//  GetUserUseCase.swift
//  MVVM-Coordinator
//
//  Created by Sachin Daingade on 18/08/26.
//

//protocol GetUserUseCase {
//    func execute() async throws -> UserDetails
//}
import Combine
import Foundation

protocol LoginUseCase {
    func execute( email: String,  password: String) -> AnyPublisher<UserDetails, NSError>
}


