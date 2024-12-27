import Foundation

// building structure
struct Building: Identifiable {
    let id = UUID()
    let name: String
    let bathrooms: [Bathroom]
}
// reviews structure
struct Review: Identifiable {
    let id = UUID()
    let title: String
    let content: String
    let rating: Int
    let gender: String
}
// bathroom structure
struct Bathroom: Identifiable {
    let id = UUID()
    let location: String
    let stalls: Int
    let cleanliness: Int
    let wificonnectivity: Int
    let stocked: String
    var reviews: [Review]
}


