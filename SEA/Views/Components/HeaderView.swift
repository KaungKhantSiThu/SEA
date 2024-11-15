//
//  HeaderView.swift
//  SEA
//
//  Created by Kaung Khant Si Thu on 13/11/2024.
//

import SwiftUI

struct HeaderView: View {
    @State private var isPulsing = false
    
    var body: some View {
        HStack {
            Button(action: { }) {
                Image(systemName: "chevron.left")
                    .foregroundColor(.primary)
            }
            
            Spacer()
            
            Image("logo")
                .resizable()
                .scaledToFit()
                .frame(height: 30)
            
            Spacer()
            
            Button(action: { }) {
                Image(systemName: "bell.badge.fill")
                    .foregroundColor(.primary)
                    .symbolRenderingMode(.multicolor)
                    .symbolEffect(.bounce, options: .repeating)
                    .scaleEffect(isPulsing ? 1.2 : 1.0)
            }
            .onAppear {
                withAnimation(.easeInOut(duration: 1.5).repeatForever(autoreverses: true)) {
                    isPulsing = true
                }
            }
        }
        .padding()
    }
}
