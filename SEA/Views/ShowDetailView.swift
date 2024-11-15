//
//  ShowDetailView.swift
//  SEA
//
//  Created by Kaung Khant Si Thu on 13/11/2024.
//

import SwiftUI

struct ShowDetailView: View {
    @Environment(\.dismiss) private var dismiss
    @StateObject var viewModel: ShowDetailViewModel
    @State private var offset: CGFloat = 1000
    
    var body: some View {
        ScrollView {
            ZStack(alignment: .topLeading) {
                VStack(spacing: 16) {
                    // Hero Image
                    if viewModel.isLoading {
                        ProgressView()
                            .frame(height: 300)  // Adjust height to match your design
                    } else {
                        PageView(pages:
                            viewModel.relatedEvents.map {
                                Image($0.imageName)
                            }
                        )
                    }
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text("ZONE 1")
                            .font(.caption2)
                            .foregroundStyle(.secondary)
                        
                        Text(viewModel.show.title)
                            .font(.title2)
                            .fontWeight(.bold)
                        
                        // Location indicator
                        HStack {
                            Label("\(viewModel.show.distance)m away", systemImage: "figure.walk")
                            Button("Map") {
                                // Handle map action
                            }
                            .foregroundColor(.accentColor)
                        }
                        .font(.caption)
                        .foregroundStyle(.secondary)
                        .padding(5)
                        .background(.gray, in: RoundedRectangle(cornerRadius: 5)
                            .stroke()
                        )
                        
                        Text(viewModel.show.description)
                    }
                    .padding()
                }
                
                Button {
                    withAnimation {
                        dismiss()
                    }
                } label: {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundStyle(.white)
                        .font(.title)
                        
                }
                .padding()
            }
        }
        .offset(y: offset)
        .gesture(
            DragGesture()
                .onEnded { gesture in
                    if gesture.translation.height > 100 {
                        withAnimation(.spring(response: 0.3, dampingFraction: 0.7)) {
                            dismiss()
                        }
                    }
                }
        )
        .onAppear {
            withAnimation(.spring(response: 0.6, dampingFraction: 0.8)) {
                offset = 0
            }
        }
        .ignoresSafeArea()
    }
}

#Preview {
    ShowDetailView(viewModel: ShowDetailViewModel(show: .alligatorGar))
}
