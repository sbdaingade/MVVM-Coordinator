//
//  AppCoordinator.swift
//  MVVM-Coordinator
//
//  Created by Sachin Daingade on 18/08/26.
//

import SwiftUI
import Combine

@MainActor
final class AppCoordinator: ObservableObject {

    enum Route: Hashable {
        case login
        case home
    }

    @Published var path = NavigationPath()

    func showLogin() {
        path.append(Route.login)
    }

    func showHome() {
        path.append(Route.home)
    }

    func pop() {
        path.removeLast()
    }

    func resetToRoot() {
        path = NavigationPath()
    }
}
