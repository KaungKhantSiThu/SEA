//
//  ContentView.swift
//  SEA
//
//  Created by Kaung Khant Si Thu on 13/11/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            
            HomeView()
                .tabItem { Label("Home", image: "home") }
            
            Text("Hello")
                .tabItem { Label("Wallet", systemImage: "creditcard") }
            
            Text("More")
                .tabItem { Label("More", systemImage: "ellipsis") }
        }
        
    }
}

#Preview {
    ContentView()
}
