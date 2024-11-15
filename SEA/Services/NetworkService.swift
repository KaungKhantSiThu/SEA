//
//  NetworkServiceProtocol.swift
//  SEA
//
//  Created by Kaung Khant Si Thu on 13/11/2024.
//

import Foundation
import Combine

protocol NetworkServiceProtocol {
    func fetchShows() -> AnyPublisher<[Show], Error>
    func fetchEvents() -> AnyPublisher<[Event], Error>
}

class NetworkService: NetworkServiceProtocol {
    func fetchShows() -> AnyPublisher<[Show], Error> {
        // Implement actual API call
        Just([Show.alligatorGar])
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
    
    func fetchEvents() -> AnyPublisher<[Event], Error> {
        // Implement actual API call
        Just(Event.preview)
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
} 
