import SwiftUI

struct CustomTabBar: View {
    var body: some View {
        HStack(spacing: 0) {
            TabBarButton(icon: "house.fill", title: "Home", isSelected: true)
            TabBarButton(icon: "creditcard", title: "Wallet", isSelected: false)
            TabBarButton(icon: "ellipsis", title: "More", isSelected: false)
        }
        .padding(.vertical, 10)
        .shadow(radius: 2)
    }
}

struct TabBarButton: View {
    let icon: String
    let title: String
    let isSelected: Bool
    
    var body: some View {
        VStack(spacing: 4) {
            Image(systemName: icon)
                .foregroundColor(isSelected ? .red : .gray)
            Text(title)
                .font(.caption)
                .foregroundColor(isSelected ? .red : .gray)
        }
        .frame(maxWidth: .infinity)
    }
} 
