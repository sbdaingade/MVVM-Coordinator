//
//  LoginViewModel.swift
//  MVVM-Coordinator
//
//  Created by Sachin Daingade on 18/08/26.
//
import Combine
import Foundation

@MainActor
final class LoginViewModel: ObservableObject {
//    "email": "test@gmail.com",
//    "password": "securePassword123",
    @Published var username = "test@gmail.com"
    @Published var password = "securePassword123"
    @Published var isLoading = false
    @Published var errorMessage: String?

    private let loginUseCase: LoginUseCase
    private let coordinator: AppCoordinator
    private var cancellables = Set<AnyCancellable>()
   
    init(loginUseCase: LoginUseCase,  coordinator: AppCoordinator) {
        self.loginUseCase = loginUseCase
        self.coordinator = coordinator
    }

    func login() async {
        guard !username.isEmpty else {
            errorMessage = "Please enter username"
            return
        }

        guard !password.isEmpty else {
            errorMessage = "Please enter password"
            return
        }

        isLoading = true
        errorMessage = nil

        loginUseCase
            .execute(email: username, password: password)
            .receive(on: DispatchQueue.main)
            .sink(
                receiveCompletion: { [weak self] completion in
                    guard let self else { return }

                    self.isLoading = false

                    if case .failure(let error) = completion {
                        self.errorMessage = error.localizedDescription
                    }
                },
                receiveValue: { [weak self] _ in
                    guard let self else { return }

                    self.isLoading = false
                    self.coordinator.showHome()
                }
            )
            .store(in: &cancellables)
    }
}

