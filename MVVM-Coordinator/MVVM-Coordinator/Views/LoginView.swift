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
                .onChange(of: viewModel.username) {
                    viewModel.errorMessage = nil
                }

            SecureField("Password", text: $viewModel.password)
                .textFieldStyle(.roundedBorder)
                .onChange(of: viewModel.password) {
                    viewModel.errorMessage = nil
                }

            // Error message
            if let errorMessage = viewModel.errorMessage {
                Text(errorMessage)
                    .font(.caption)
                    .foregroundStyle(.red)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }

            Button("Login") {
                Task {
                    await viewModel.login()
                }
            }
            .disabled(viewModel.isLoading)

            if viewModel.isLoading {
                ProgressView()
            }
        }
        .padding()
        .navigationTitle("Login")
    }
}
//#Preview {
//    let app = AppCoordinator()
//    LoginView(viewModel: LoginViewModel(coordinator: app))
//}
