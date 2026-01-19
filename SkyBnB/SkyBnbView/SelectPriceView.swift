import SwiftUI

struct SelectPriceView: View {
    var onTap: (String) -> Void
    
    var body: some View {
        VStack{
            Text("What price range are you looking at?")
            Button("$1000-$4999"){onTap("$1000-$4999")}
                .buttonStyle(.borderedProminent)
            Button("$5000-$9999"){onTap("$5000-$9999")}
                .buttonStyle(.borderedProminent)
            Button("$10000+"){onTap("$10000+")}
                .buttonStyle(.borderedProminent)
        }
    }
}


#Preview {
    SelectPriceView(onTap: {_ in print("Price")})
}
