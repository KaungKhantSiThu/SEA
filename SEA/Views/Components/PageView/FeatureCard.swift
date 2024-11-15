//
//  FeatureCard.swift
//  SEA
//
//  Created by Kaung Khant Si Thu on 13/11/2024.
//


import SwiftUI


struct FeatureCard: View {
    var event: Event
    @State private var isLoaded = false


    var body: some View {
        Image(event.imageName)
            .resizable()
            .overlay {
                TextOverlay(text: event.text)
            }
            .opacity(isLoaded ? 1 : 0)
            .blur(radius: isLoaded ? 0 : 10)
            .onAppear {
                withAnimation(.easeOut(duration: 0.8)) {
                    isLoaded = true
                }
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
