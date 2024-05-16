

import SwiftUI

struct PurchaseView: View {
    var purchase: Purchase
    
    var body: some View {
        VStack {
            Image(purchase.movie.name)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.4)
                .clipped()
            VStack(alignment: .leading) {
                Text(purchase.movie.name)
                    .font(.headline)
                Text(purchase.movie.description)
                Text("Seats: \(purchase.seats.joined(separator: ", "))")
                Text("Total Price: $\(purchase.totalPrice, specifier: "%.2f")")
            }
            .padding()
        }
    }
}
