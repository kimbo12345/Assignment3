//
//  MovieView.swift
//  assignment3
//
//  Created by Jerry Lo on 10/5/2024.
//

import SwiftUI

struct MovieView: View {
    var username: String
    var movie: MenuView.Movie
    
    @State private var quantity: Int = 1
    
    var body: some View {
        VStack {
            Text("\(movie.title)")
                .font(.headline)
            Text("\(movie.description)")
                .font(.subheadline)
            Text("Movie Length: \(movie.length)")
                .font(.subheadline)
            Text("Adult Ticket Price: $\(movie.ticketPrice)")
                .font(.subheadline)
            
            Stepper("Quantity: \(quantity)", value: $quantity)
                .padding()
            
            Button(action: {
                // implement a navigationlink or something here
                // might also need to transfer ticket info + quantity + user info
            }) {
                Text("Select Seat")
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
            }
            .padding()
            
            Spacer()
        }
        .padding()
        .navigationTitle("Movie Details")
    }
}
