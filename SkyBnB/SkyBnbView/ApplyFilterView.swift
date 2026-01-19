import SwiftUI

struct ApplyFilterView: View {
    var price: String
    var amenities: String
    var onTap: () -> Void
    
    var body: some View {
        VStack{
            Text("Price Range: \(price)")
            Text("Amenities: \(amenities)")
            Button("Apply Filters"){onTap()}
            .buttonStyle(.borderedProminent)
        }
    }
}

#Preview {
    ApplyFilterView(price: "price", amenities: "amenities", onTap: {})
}
