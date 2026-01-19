import SwiftUI
import Observation

// what are the possible screen states
enum skyStates: Hashable {
    // i am thinking a case home with optional strings in the scenario users filter price and amenities
    case selectPrice
    case selectAmenities(price: String)
    case applyFilter(price: String, amenities: String)
}


// what can the users do to cause changes on the states
enum skyIntents {
    case viewSkies
    case priceSelected(String)
    case amenitiesSelected(String, String)
    case restart
}

@Observable @MainActor class SkyBnbViewModel {
    var navPath: [skyStates] = []
    
    var selectedPrice: String? = nil
    var selectedAmenities: String? = nil
    
    func handle(_ intent: skyIntents) {
        switch intent {
        case .viewSkies:
            navPath.append(.selectPrice)
        case .priceSelected(let price):
            navPath.append(.selectAmenities(price: price))
        case .amenitiesSelected(let price, let amenities):
            navPath.append(.applyFilter(price: price, amenities: amenities))
        case .restart:
            navPath = []
        }
    }
}
