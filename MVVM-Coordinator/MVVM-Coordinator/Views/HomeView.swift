//
//  HomeView.swift
//  MVVM-Coordinator
//
//  Created by Sachin Daingade on 18/08/26.
//

import SwiftUI

struct HomeView: View {

    @StateObject var viewModel: HomeViewModel

    var body: some View {
        VStack(spacing: 20) {

        Text("Home view")

            Button("Login") {
                Task {
                    viewModel.pop()
                }
            }
        }
        .padding()
        .navigationTitle("HomeView")
    }
}
