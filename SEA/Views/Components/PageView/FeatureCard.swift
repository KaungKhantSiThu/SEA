//
//  FeatureCard.swift
//  Landmarks
//
//  Created by Kaung Khant Si Thu on 10/11/2024.
//


import SwiftUI


struct FeatureCard: View {
    var event: Event


    var body: some View {
        Image(event.imageName)
            .resizable()
            .overlay {
                TextOverlay(text: event.text)
            }
    }
}


struct TextOverlay: View {
    var text: String


    var gradient: LinearGradient {
        .linearGradient(
            Gradient(colors: [.black.opacity(0.3), .black.opacity(0)]),
            startPoint: .bottom,
            endPoint: .center)
    }


    var body: some View {
        ZStack(alignment: .leading) {
            gradient
            Text(text)
                .font(.title)
                .bold()
                .padding()
        }
        .foregroundStyle(.white)
    }
}
