import SwiftUI

struct ShowDetailView: View {
    @Environment(\.dismiss) private var dismiss
    let show: Show
    
    var body: some View {
        ScrollView {
            ZStack(alignment: .topLeading) {
                Button {
                    withAnimation {
                        dismiss()
                    }
                } label: {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundStyle(.white)
                }
                
                VStack(spacing: 16) {
                    // Hero Image
                    PageView(pages:
                                Event.preview.map {
                        Image($0.imageName)
                    }
                    )
                    
                    VStack(alignment: .leading, spacing: 8) {
                        Text("ZONE 1")
                            .font(.caption2)
                            .foregroundStyle(.secondary)
                        
                        // Title and description
                        Text(show.title)
                            .font(.title2)
                            .fontWeight(.bold)
                        
                        // Location indicator
                        HStack {
                            Label("\(show.distance)m away", systemImage: "figure.walk")
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
                        
                        Text(show.description)
                    }
                    .padding()
                }
            }
        }
        .ignoresSafeArea()
    }
}

// Show model
struct Show {
    let id = UUID()
    let title: String
    let time: String
    let image: String
    let distance: Int
    let description: String
}

extension Show {
    static let alligatorGar = Show(
        title: "Alligator Gar",
        time: "10am - 5pm",
        image: "alligator-gar",
        distance: 410,
        description: """
        With its wide, alligator-like snout and razor-sharp teeth, it's easy to see how this fish acquired its name. Despite its ferocious appearance, the alligator gar poses little threat to human beings. They prefer to lie and wait for unsuspecting prey within reach, before lunging forward to grab their prey.
        
        As the largest species in the gar family, the alligator gar can reach up to 3 metres in length. Scientists have traced this species in fossil records dating back to 100 million years ago, hence they are also known as living fossils!
        """
    )
}

#Preview {
    ShowDetailView(show: .alligatorGar)
}
