//
//  UserDetails.swift
//  MVVM-Coordinator
//
//  Created by Sachin Daingade on 18/08/26.
//
import Foundation

struct UserDetails: Codable {
    let token, tokenType: String
    let expiresIn: Int
    let user: NewUser
}

// MARK: - User
struct NewUser: Codable {
    let id, email, name: String
}
