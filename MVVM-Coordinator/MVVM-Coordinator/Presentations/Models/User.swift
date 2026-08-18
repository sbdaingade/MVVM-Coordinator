//
//  User.swift
//  MVVM-Coordinator
//
//  Created by Sachin Daingade on 18/08/26.
//

import Foundation
 struct User: Codable, Identifiable {
    var id: Int
    var name: String
    var username: String
    var email: String
    var phone: String
}
