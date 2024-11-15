//
//  UpcomingShowsSection.swift
//  SEA
//
//  Created by Kaung Khant Si Thu on 13/11/2024.
//

import SwiftUI

struct UpcomingShowsSection: View {
    var body: some View {
        VStack(spacing: 12) {
            HStack {
                Text("Upcoming Shows")
                    .font(.title3)
                    .fontWeight(.semibold)
                
                Spacer()
                
                Button("View all") {
                    // Handle view all action
                }
                .foregroundColor(.accentColor)
            }
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 16) {
                    ShowCard(
                        time: "2:30 PM",
                        title: "Dive Feeding @ Shipwreck",
                        image: "show-1"
                    )
                    
                    ShowCard(
                        time: "2:40 PM",
                        title: "Say Cheese Shark",
                        image: "show-2"
                    )
                    
                    ShowCard(
                        time: "3:20 PM",
                        title: "Say Cheese Shark",
                        image: "show-2"
                    )
                }
            }
        }
        .padding()
    }
}

struct ShowCard: View {
    let time: String
    let title: String
    let image: String
    
    var body: some View {
        ZStack(alignment: .topLeading) {
            Image(image)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 240, height: 160)
                .clipShape(RoundedRectangle(cornerRadius: 12))
                .shadow(radius: 5)
            
            
            VStack(alignment: .leading) {
                Label(time, systemImage: "clock")
                    .font(.caption)
                    .padding(.horizontal, 8)
                    .padding(.vertical, 4)
                    .background(.background)
                    .clipShape(RoundedRectangle(cornerRadius: 7))
                    .padding(10)
                
                Spacer()
                
                Text(title)
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
            }
        }
    }
} 
