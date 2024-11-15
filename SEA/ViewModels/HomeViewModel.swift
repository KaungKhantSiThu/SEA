//
//  HomeViewModel.swift
//  SEA
//
//  Created by Kaung Khant Si Thu on 13/11/2024.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    @Published var showsDetail: Bool = false
    @Published var events: [Event] = Event.preview
    @Published var upcomingShows: [Show] = []
    
    private var cancellables = Set<AnyCancellable>()
    
    init() {
        // In a real app, you would fetch data here
        fetchUpcomingShows()
    }
    
    private func fetchUpcomingShows() {
        // Simulate API call
        // In real app, this would be a network service call
        Just([
            Show.alligatorGar
            // Add more shows
        ])
        .delay(for: .seconds(0.5), scheduler: DispatchQueue.main)
        .sink { [weak self] shows in
            self?.upcomingShows = shows
        }
        .store(in: &cancellables)
    }
} 
