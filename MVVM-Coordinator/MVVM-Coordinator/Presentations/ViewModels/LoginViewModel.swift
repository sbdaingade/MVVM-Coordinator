//
//  LoginViewModel.swift
//  MVVM-Coordinator
//
//  Created by Sachin Daingade on 18/08/26.
//
import Combine

@MainActor
final class LoginViewModel: ObservableObject {

    @Published var username = ""
    @Published var password = ""

    private let coordinator: AppCoordinator

    init(coordinator: AppCoordinator) {
        self.coordinator = coordinator
    }

    func login() async {
        // Call use case here

        coordinator.showHome()
    }
}
