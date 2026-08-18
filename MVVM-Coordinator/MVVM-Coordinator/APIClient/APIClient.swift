//
//  APIClient.swift
//  MVVM-Coordinator
//
//  Created by Sachin Daingade on 18/08/26.
//

import Combine
import Foundation

protocol APIClient {
    func fetchUser() async throws -> UserDetails
   
    
}


//final class APIClientImplementation: APIClient {
//    func fetchUser() async throws -> UserDetails {
//        return
//    }
//}



protocol LoginAPIClient {
    func login(email: String,password: String ) -> AnyPublisher<UserDetails, NSError>
}

/// "x-api-key": 753cc148-b13a-4f8c-ad5d-99a9cea6ea52
/*
 {
   "email": "antonio@example.com",
   "password": "securePassword123"
 }
 
 
 required
 • x-api-key <your_api_key>
 • Content-Type  application/json

 
 {
     "email": "test@gmail.com",
     "password": "securePassword123",
     "name": "Test User"
 }
 
 {
     "token": "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOiJ0ZXN0QGdtYWlsLmNvbSIsIm5hbWUiOiJUZXN0IFVzZXIiLCJleHAiOjE3ODcwNzkxODUsImlhdCI6MTc4NzA3NTU4NX0.U_u3X1Urk-U3VKTzw-hVHSmeB68Z5K8wOt_wA6Z0zHg",
     "tokenType": "Bearer",
     "expiresIn": 3600,
     "user": {
         "id": "e2f922a0-f0d5-419e-a539-85225ace5290",
         "email": "test@gmail.com",
         "name": "Test User"
     }
 }
 */


// https://api.restful-api.dev/login

final class LoginAPIClientImplementation : LoginAPIClient {
    private let baseURL = URL(string: "https://api.restful-api.dev/login")!

    func login(email: String, password: String) -> AnyPublisher<UserDetails, NSError> {
        var request = URLRequest(url: baseURL)
        request.httpMethod = "POST"
        request.setValue("e1510571-1bd6-4be3-a79b-8ff8692776c8", forHTTPHeaderField: "x-api-key")
        request.setValue( "application/json",forHTTPHeaderField: "Content-Type")
        let body = User( email: email,password: password)
        
        do {
            request.httpBody = try JSONEncoder().encode(body)
        } catch {
            return Fail(error: error as NSError)
                .eraseToAnyPublisher()
        }
        
        return URLSession.shared.dataTaskPublisher(for: request)
            .tryMap { output in
                guard let response = output.response as? HTTPURLResponse else {
                    throw NSError(
                        domain: "APIError",
                        code: -1
                    )
                }
                
                guard 200..<300 ~= response.statusCode else {
                    throw NSError(
                        domain: "APIError",
                        code: response.statusCode
                    )
                }
                
                return output.data
            }
            .decode(type: UserDetails.self, decoder: JSONDecoder())
            .mapError { error in
                error as NSError
            }
            .eraseToAnyPublisher()
    }
}

