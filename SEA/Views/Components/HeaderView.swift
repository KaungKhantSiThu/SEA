import SwiftUI

struct HeaderView: View {
    
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
                    .symbolEffect(.wiggle)
            }
        }
        .padding()
    }
}
