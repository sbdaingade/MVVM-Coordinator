//
//  AppView.swift
//  MVVM-Coordinator
//
//  Created by Sachin Daingade on 18/08/26.
//
import SwiftUI

struct AppView: View {

    @StateObject private var coordinator = AppCoordinator()

    var body: some View {
        NavigationStack(path: $coordinator.path) {

            LoginView(
                viewModel: LoginViewModel(
                    coordinator: coordinator
                )
            )

            .navigationDestination(
                for: AppCoordinator.Route.self
            ) { route in

                switch route {
                case .login:
                    LoginView(
                        viewModel: LoginViewModel(
                            coordinator: coordinator
                        )
                    )

                case .home:
                    HomeView(
                        viewModel: HomeViewModel(
                            coordinator: coordinator
                        )
                    )
                }
            }
        }
        .environmentObject(coordinator)
    }
}
