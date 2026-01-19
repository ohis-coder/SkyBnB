import SwiftUI

struct SkyRootView: View {
    @State var vm = SkyBnbViewModel()
    
    
    var body: some View {
        NavigationStack(path: $vm.navPath) {
            VStack(spacing: 20) {
                
                Text("Houses available only on SkyBnB!")
                Text("Ready to book your Detty December Home?")
                Label("House A", systemImage: "sparkles")
                Label("House B", systemImage: "house.fill")
                Label("House C", systemImage: "house")
                Label("House D", systemImage: "star.fill")
                
                Button("Filter Houses"){
                    vm.handle(.viewSkies)
                }
                .buttonStyle(.borderedProminent)
                .navigationTitle("Home")
                .navigationDestination(for: skyStates.self) {state in
                    switch state {
                    case .selectPrice:
                        SelectPriceView(onTap: {price in
                            vm.handle(.priceSelected(price))})
                    case .selectAmenities(let price):
                        SelectAmenitiesView(price: price, onTap: {amenities in
                            vm.handle(.amenitiesSelected(price, amenities))})
                    case .applyFilter(let price, let amenities):
                        ApplyFilterView(price: price, amenities: amenities, onTap: {vm.handle(.restart)})
                    }
                }
            }
        }
    }
}


#Preview {
    SkyRootView()
}
