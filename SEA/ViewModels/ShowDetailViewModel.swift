//
//  ShowDetailViewModel.swift
//  SEA
//
//  Created by Kaung Khant Si Thu on 13/11/2024.
//

import Foundation
import Combine

class ShowDetailViewModel: ObservableObject {
    @Published var show: Show
    @Published var relatedEvents: [Event] = []
    @Published var isLoading = true
    
    private var cancellables = Set<AnyCancellable>()
    
    init(show: Show) {
        self.show = show
        fetchRelatedEvents()
    }
    
    private func fetchRelatedEvents() {
        Just(Event.preview)
            .delay(for: .seconds(1), scheduler: DispatchQueue.main)
            .sink { [weak self] events in
                self?.relatedEvents = events
                self?.isLoading = false
            }
            .store(in: &cancellables)
    }
} 
