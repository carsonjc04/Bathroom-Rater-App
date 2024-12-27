import SwiftUI

struct BathroomDetailView: View {
    let bathroom: Bathroom

// title of bathroom view
    var body: some View {
        VStack {
            Text("\(bathroom.location)")
                .fontWeight(.bold)
                .font(.title)
                .padding()
// no reviews?
            if bathroom.reviews.isEmpty {
                Text("No one has added a review yet. Check back later!")
                    .foregroundColor(.gray)
                    .padding()
            } else {
                
                // list of all reviews
                List {
                    ForEach(bathroom.reviews) { review in
                        VStack(alignment: .leading) {
                            Text(review.title)
                                .font(.headline)
                            Text(review.content)
                            Text("Rating: \(review.rating)/5")
                            Text("Gender: \(review.gender)")
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                        // so text doesn't go out of screen
                        .padding()
                    }
                }
            }

        }
    }
}


