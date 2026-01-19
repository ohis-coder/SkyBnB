import SwiftUI

struct SelectAmenitiesView: View {
    var price: String
    var onTap: (String) -> Void
    
    var body: some View {
        Text("Okay, your price range is \(price), what about amenities?")
        Button("Air Conditioning"){onTap("Air Conditioning")}
            .buttonStyle(.borderedProminent)
        Button("Wi-Fi"){onTap("Wi-Fi")}
            .buttonStyle(.borderedProminent)
        Button("Pool"){onTap("Pool")}
            .buttonStyle(.borderedProminent)
        Button("Room Service"){onTap("Room Service")}
            .buttonStyle(.borderedProminent)
    }
}


#Preview {
    SelectAmenitiesView(price: "price", onTap: {_ in})
}
