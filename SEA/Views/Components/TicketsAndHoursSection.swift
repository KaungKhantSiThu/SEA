import SwiftUI

struct TicketsAndHoursSection: View {
    var body: some View {
        ScrollView(.horizontal) {
            HStack(spacing: 15) {
                // E-tickets Card
                CTACard(
                    title: "My e-tickets",
                    description: "There aren't any yet.",
                    buttonTitle: "Retrieve here",
                    imageName: "ticket") {
                        print("My etickets")
                    }
                    .frame(width: 160, height: 200)
                
                
                // Park Hours Card
                CTACard(
                    title: "Park hours",
                    description: "Today, 13 Feb 10am - 5pm",
                    buttonTitle: "Plan my visit",
                    imageName: "clock") {
                        print("My etickets")
                    }
                    .frame(width: 160, height: 200)
            }
            .padding()
        }
    }
} 

struct CTACard: View {
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    
    let title: String
    let description: String
    let buttonTitle: String
    let imageName: String
    let action: () -> Void
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Text(title)
                    .font(.caption)
                Spacer()
                Image(imageName)
            }
            Text(description)
                .font(.title3)
                .lineLimit(2)
                .foregroundColor(.secondary)
            
            Button(buttonTitle) {
                // Action
                action()
            }
            .foregroundColor(.red)
        }
        .padding()
        .background((colorScheme == .light) ? .white : .black )
        .cornerRadius(20)
        .shadow(color: .gray.opacity( (colorScheme == .light) ? 0.2 : 0.4), radius: 5)
    }
}
