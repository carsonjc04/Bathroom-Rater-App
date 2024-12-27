import SwiftUI

struct BuildingDetailView: View {
    let building: Building
    
// makes sure bathroom is not selected yet
    @State private var selectedBathroom: Bathroom? = nil
    @State private var showBathroomDetail = false

    // title of building screen
    var body: some View {
        VStack {
            Text("\(building.name) Bathrooms")
                .fontWeight(.bold)
                .font(.largeTitle)
                .padding()
            
// list of bathrooms w/ their information
            List {
                ForEach(building.bathrooms) { bathroom in
                    Button(action: {
                        selectedBathroom = bathroom
                        showBathroomDetail = true
                    }) {
                        VStack(alignment: .leading) {
                            Text("Location: \(bathroom.location)")
                            Text("Stalls: \(bathroom.stalls)")
                            Text("Cleanliness: \(bathroom.cleanliness)/5")
                            Text("WiFi Connectivity: \(bathroom.wificonnectivity)/10")
                        }
                        .padding()
                    }
                }
            }
        }
        
        .navigationTitle(building.name)
        .sheet(isPresented: $showBathroomDetail) {
            if let bathroom = selectedBathroom {
                BathroomDetailView(bathroom: bathroom)
            }
        }

    }
}
