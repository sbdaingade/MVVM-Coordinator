//
//  AppView.swift
//  MVVM-Coordinator
//
//  Created by Sachin Daingade on 18/08/26.
//
import SwiftUI

struct AppView: View {

    @StateObject private var coordinator = AppCoordinator()
    let loginUseCase = LoginUseCaseImpl(repository: UserRepositoryImpl(apiClient: LoginAPIClientImplementation()))
    var body: some View {
        NavigationStack(path: $coordinator.path) {

            LoginView(
                viewModel: LoginViewModel(
                    loginUseCase: loginUseCase, coordinator: coordinator
                )
            )

            .navigationDestination(
                for: AppCoordinator.Route.self
            ) { route in

                switch route {
                case .login:
                    LoginView(
                        viewModel: LoginViewModel(loginUseCase: loginUseCase,
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
