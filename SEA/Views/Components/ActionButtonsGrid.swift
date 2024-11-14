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
    
    var body: some View {
        LazyVGrid(columns: [
            GridItem(.flexible()),
            GridItem(.flexible()),
            GridItem(.flexible()),
            GridItem(.flexible())
        ], spacing: 20) {
            ForEach(actions) { item in
                Button {
                    showsDetail = true
                } label: {
                    VStack {
                        Image(item.icon)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 30, height: 30)
                            .padding()
                            .background(.gray.opacity(0.1), in: Circle())
                        Text(item.title)
                            .font(.caption)
                    }
                }
                .buttonStyle(.plain)
            }
        }
    }
}

struct ActionItem: Identifiable {
    let id = UUID()
    let icon: String
    let title: String
}
