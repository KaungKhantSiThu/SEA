//
//  ActionButtonsGrid.swift
//  SEA
//
//  Created by Kaung Khant Si Thu on 13/11/2024.
//

import SwiftUI

struct ActionButtonsGrid: View {
    let actions = [
        ActionItem(icon: "map", title: "Map"),
        ActionItem(icon: "inhabitants", title: "Inhabitants"),
        ActionItem(icon: "shows", title: "Shows"),
        ActionItem(icon: "shopping", title: "Shopping"),
        ActionItem(icon: "dine", title: "Dine"),
        ActionItem(icon: "meet-greet", title: "Meet & Greets")
    ]
    
    @Binding var showsDetail: Bool
    @State private var isLoaded = false
    
    var body: some View {
        LazyVGrid(columns: [
            GridItem(.flexible()),
            GridItem(.flexible()),
            GridItem(.flexible()),
            GridItem(.flexible())
        ], spacing: 20) {
            ForEach(Array(actions.enumerated()), id: \.element.id) { index, item in
                Button {
                    withAnimation(.spring(response: 0.3, dampingFraction: 0.6)) {
                        showsDetail = true
                    }
                } label: {
                    VStack {
                        Image(item.icon)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 30)
                            .padding()
                            .background(.gray.opacity(0.1), in: Circle())
                            .scaleEffect(isLoaded ? 1 : 0)
                            .offset(y: isLoaded ? 0 : 20)
                        Text(item.title)
                            .font(.caption2)
                            .opacity(isLoaded ? 1 : 0)
                    }
                }
                .buttonStyle(.plain)
                .onAppear {
                    withAnimation(.spring(response: 0.6, dampingFraction: 0.7)
                        .delay(Double(index) * 0.1)) {
                        isLoaded = true
                    }
                }
            }
        }
    }
}

struct ActionItem: Identifiable {
    let id = UUID()
    let icon: String
    let title: String
}
