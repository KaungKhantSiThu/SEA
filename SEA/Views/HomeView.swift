import SwiftUI

struct HomeView: View {
    @State private var showsDetail: Bool = false

    var body: some View {
        NavigationView {
            VStack(spacing: 0) {
                // Header
                HeaderView()
                
                ScrollView {
                    VStack(spacing: 20) {
                        // Hero Banner
                        PageView(pages:
                                    Event.preview.map { FeatureCard(event: $0)
                                .onTapGesture {
                                    withAnimation(.easeInOut) {
                                        showsDetail.toggle()
                                    }
                                }
                        }
                        )
                        .listRowInsets(EdgeInsets())
                        // Action Buttons Grid
                        ActionButtonsGrid(showsDetail: $showsDetail)
                        
                        // Tickets and Hours Section
                        TicketsAndHoursSection()
                        
                        // Upcoming Shows Section
                        UpcomingShowsSection()
                    }
                }
            }
            .background(Color(.systemGroupedBackground))
            .navigationBarHidden(true)
        }
        .sheet(isPresented: $showsDetail) {
            ShowDetailView(show: .alligatorGar)
                .transition(.slide)
                .animation(.easeInOut, value: showsDetail)
        }
    }
}

#Preview {
    HomeView()
}
