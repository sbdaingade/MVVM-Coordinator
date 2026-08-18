//
//  LoginView.swift
//  MVVM-Coordinator
//
//  Created by Sachin Daingade on 18/08/26.
//
import SwiftUI

struct LoginView: View {

    @StateObject var viewModel: LoginViewModel

    var body: some View {
        VStack(spacing: 20) {

            TextField("Username", text: $viewModel.username)
                .textFieldStyle(.roundedBorder)

            SecureField("Password", text: $viewModel.password)
                .textFieldStyle(.roundedBorder)

            Button("Login") {
                Task {
                    await viewModel.login()
                }
            }
        }
        .padding()
        .navigationTitle("Login")
    }
}

#Preview {
    let app = AppCoordinator()
    LoginView(viewModel: LoginViewModel(coordinator: app))
}
