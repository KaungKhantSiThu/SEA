//
//  PageView.swift
//  SEA
//
//  Created by Kaung Khant Si Thu on 13/11/2024.
//


import SwiftUI
import Combine

struct PageView<Page: View>: View {
    var pages: [Page]
    @State private var currentPage = 0
    
    @State private var timer: AnyCancellable?
    private let slideInterval: TimeInterval = 5.0
    
    var body: some View {
        ZStack(alignment: .bottom) {
            PageViewController(pages: pages, currentPage: $currentPage)
                .aspectRatio(3 / 2, contentMode: .fit)
            
            PageControl(numberOfPages: pages.count, currentPage: $currentPage)
                .frame(width: CGFloat(pages.count * 18))
                .padding(.bottom)
        }
        .onAppear {
            startTimer()
        }
        .onDisappear {
            stopTimer()
        }
    }
    
    private func startTimer() {
        timer = Timer.publish(every: slideInterval, on: .main, in: .common)
            .autoconnect()
            .sink { _ in
                withAnimation {
                    currentPage = (currentPage + 1) % pages.count
                }
            }
    }
    
    private func stopTimer() {
        timer?.cancel()
        timer = nil
    }
}
