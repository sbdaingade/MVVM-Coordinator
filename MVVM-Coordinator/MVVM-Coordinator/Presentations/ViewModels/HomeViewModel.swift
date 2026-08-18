//
//  HomeViewModel.swift
//  MVVM-Coordinator
//
//  Created by Sachin Daingade on 18/08/26.
//

import Combine

@MainActor
final class HomeViewModel: ObservableObject {

    private let coordinator: AppCoordinator
    
    init(coordinator: AppCoordinator) {
        self.coordinator = coordinator
    }
    
    func pop() {
        coordinator.pop()
    }
}
