import SwiftUI

struct DiveFeedingBanner: View {
    var body: some View {
        ZStack(alignment: .leading) {
            // Banner Image
            Image("show-1")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 200)
//                .clipped()
//                .cornerRadius(12)
            
            // Gradient overlay for better text visibility
//            LinearGradient(
//                gradient: Gradient(colors: [
//                    .black.opacity(0.5),
//                    .clear
//                ]),
//                startPoint: .bottom,
//                endPoint: .top
//            )
//            .frame(height: 100)
//            .cornerRadius(12)
            
            // Banner Text
            VStack(alignment: .leading, spacing: 4) {
                Text("Don't miss our")
                    .font(.headline)
                    .foregroundColor(.white)
                
                Text("daily Dive Feeding!")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
            }
            .padding(.horizontal, 16)
            .padding(.bottom, 16)
        }
        .frame(height: 200)
    }
}

// Preview Provider
struct DiveFeedingBanner_Previews: PreviewProvider {
    static var previews: some View {
        DiveFeedingBanner()
            .padding()
            .previewLayout(.sizeThatFits)
    }
} 
