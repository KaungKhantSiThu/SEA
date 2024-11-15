//
//  Show.swift
//  SEA
//
//  Created by Kaung Khant Si Thu on 13/11/2024.
//

import Foundation

struct Show: Identifiable {
    let id = UUID()
    let title: String
    let time: String
    let image: String
    let distance: Int
    let description: String
} 

extension Show {
    static let alligatorGar = Show(
        title: "Alligator Gar",
        time: "10am - 5pm",
        image: "alligator-gar",
        distance: 410,
        description: """
        With its wide, alligator-like snout and razor-sharp teeth, it's easy to see how this fish acquired its name. Despite its ferocious appearance, the alligator gar poses little threat to human beings. They prefer to lie and wait for unsuspecting prey within reach, before lunging forward to grab their prey.
        
        As the largest species in the gar family, the alligator gar can reach up to 3 metres in length. Scientists have traced this species in fossil records dating back to 100 million years ago, hence they are also known as living fossils!
        """
    )
}
