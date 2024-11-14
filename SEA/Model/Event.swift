//
//  Event.swift
//  SEA
//
//  Created by Kaung Khant Si Thu on 13/11/2024.
//

import Foundation

struct Event {
    let text: String
    let imageName: String
}

extension Event {
    static let preview: [Event] = [
        Event(text: "Don't miss our daily Dive Feeding!", imageName: "show-1"),
        Event(text: "Say Cheese!", imageName: "show-2"),
        Event(text: "Hi there", imageName: "show-1")
    ]
}
