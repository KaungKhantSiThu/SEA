//
//  HomeView.swift
//  SEA
//
//  Created by Kaung Khant Si Thu on 13/11/2024.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var viewModel = HomeViewModel()
    @State private var isLoading = true
    
    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                // Header
                HeaderView()
                
                ScrollView {
                    VStack(spacing: 20) {
                        // Hero Banner
                        PageView(pages:
                                    viewModel.events.map { FeatureCard(event: $0)
                                .onTapGesture {
                                    withAnimation(.easeInOut) {
                                        viewModel.showsDetail.toggle()
                                    }
                                }
                            }
                        )
                        .listRowInsets(EdgeInsets())
                        
                        // Action Buttons Grid
                        ActionButtonsGrid(showsDetail: $viewModel.showsDetail)
                        
                        // Tickets and Hours Section
                        TicketsAndHoursSection()
                        
                        // Upcoming Shows Section
                        UpcomingShowsSection()
                    }
                }
            }
            .background(Color(.systemGroupedBackground))
            .navigationBarHidden(true)
            .opacity(isLoading ? 0 : 1)
            .onAppear {
                withAnimation(.easeIn(duration: 0.6)) {
                    isLoading = false
                }
            }
        }
        .sheet(isPresented: $viewModel.showsDetail) {
            ShowDetailView(viewModel: ShowDetailViewModel(show: .alligatorGar))
                .transition(.slide)
                .animation(.easeInOut, value: viewModel.showsDetail)
        }
    }
}

#Preview {
    HomeView()
}
