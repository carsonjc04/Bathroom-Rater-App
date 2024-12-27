import SwiftUI

struct ContentView: View {
    let buildings = [
        // Library bathrooms and their reviews
    Building(name: "Library", bathrooms: [
        
        Bathroom(location: "1st Floor (UNISEX)", stalls: 10, cleanliness: 4, wificonnectivity: 2, stocked: "Yes", reviews: [
            
    Review(title: "Love the private stalls", content: "The bathroom is suuuper clean and it has private stalls.", rating: 5, gender: "Unisex"),
    
    Review(title: "Always stocked", content: "This is the bathroom I always go to. It's always stocked and it has private stalls 😁", rating: 4, gender: "Unisex")
    
                ]),
    Bathroom(location: "2nd Floor", stalls: 5, cleanliness: 2, wificonnectivity: 7, stocked: "No", reviews: [
        
    Review(title: "Disgusting", content: "It's always very crowded and you can tell they never take care of it.", rating: 2, gender: "M")
                ]),
        
    Bathroom(location: "3rd Floor", stalls: 7, cleanliness: 5, wificonnectivity: 2, stocked: "No",  reviews: []),
        
    Bathroom(location: "4th Floor", stalls: 2, cleanliness: 1, wificonnectivity: 1, stocked: "No",  reviews: [
        
    Review(title: "just go to the first floor", content: "never stocked", rating: 1, gender: "F")
                ]),
            ]),
    
    // ECS bathrooms and their reviews
    
    Building(name: "ECS", bathrooms: [
    Bathroom(location: "1st Floor", stalls: 5, cleanliness: 3, wificonnectivity: 2, stocked: "Yes",  reviews: [
                    Review(title: "Average Experience", content: "It's okay, not too bad.", rating: 3, gender: "F"),
                ]),
    
    Bathroom(location: "Engineering Bathrooms (1st Floor)", stalls: 5, cleanliness: 3, wificonnectivity: 2, stocked: "Yes", reviews: [
                    Review(title: "Outdated, old", content: "it's clean ig but it's very outdated. there's no partition between the urinals.", rating: 3, gender: "M"),
                ])
            ])
        ]

    @State private var selectedBuilding: Building? // button tracks to that specific building view
    @State private var showDetail = false

    var body: some View {
        NavigationView {
        //map for when you load in
            ZStack { // background
                Image("CampusMap")
                    .resizable()
                    .scaledToFit()
                    .edgesIgnoringSafeArea(.all)

           // circles for building locations
                
        // library location
                VStack { // vstack so it goes on top of map
                    Button(action: {
                        selectedBuilding = buildings.first { $0.name == "Library" }
                        showDetail = true
                    }) {
                        Circle()
                            .fill(Color.blue.opacity(0.7))
                            .frame(width: 30, height: 30)
                    }
                    .position(x: 170, y: 375)

        //ECS location
                    Button(action: {
                        selectedBuilding = buildings.first(where: { $0.name == "ECS" })
                        showDetail = true
                    }) {
                        Circle()
                            .fill(Color.green.opacity(0.7))
                            .frame(width: 30, height: 30)

                    }
                    .position(x: 240, y: 10)
                }
            }
            
            // logo
            .navigationTitle("")
            .toolbar {
                            ToolbarItem(placement: .principal) {
                                    Image("logo")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height: 120)
                            }
                        }
            // if selectedBuilding is triggered, go to that building
                .sheet(isPresented: $showDetail) {
                    if let building = selectedBuilding {
                        BuildingDetailView(building: building)
                    }
                }
            }
    }
}
