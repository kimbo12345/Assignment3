//
//  MovieView.swift
//  assignment3
//
//  Created by Jerry Lo on 10/5/2024.
//

import SwiftUI

struct Movie {
    var title: String
    var description: String
    var length: String
    var ticketPrice: Double
}

enum TicketType: String, CaseIterable {
    case kids = "Kids"
    case adults = "Adults"
    case concession = "Concession"
}


struct MovieView: View {
    var username: String
    var movie: MenuView.Movie
    @State private var kidsQuantity: Int = 0
    @State private var adultsQuantity: Int = 0
    @State private var concessionQuantity: Int = 0
    
    // Dictionary mapping movie titles to image names
    let movieImages: [String: String] = [
        "Parasite (2019)": "image1",
        "Burning (2018)": "image2",
        "Oldboy (2003)": "image3",
        // Add more mappings as needed
    ]
    
    // Total price calculation
    var totalPrice: Double {
        let kidsPrice = Double(kidsQuantity) * 9.99
        let adultsPrice = Double(adultsQuantity) * 12.99
        let concessionPrice = Double(concessionQuantity) * 10.99
        return kidsPrice + adultsPrice + concessionPrice
    }

    var body: some View {
        ScrollView {
            VStack {
                // Movie Poster
                if let imageName = movieImages[movie.title] {
                    Image(imageName)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 200, height: 300)
                        .padding(.bottom)
                } else {
                    Text("No poster available.")
                }

                Text("\(movie.description)")
                    .font(.subheadline)
                    .padding(.horizontal) // Add horizontal padding for better readability
                Spacer()
                Text("Duration: \(movie.length)")
                    .font(.subheadline)
                    .fontWeight(.bold)
                Spacer()
                
                // Ticket Quantity Steppers
                VStack {
                    HStack {
                        Stepper("Kids (\(kidsQuantity))", value: $kidsQuantity, in: 0...10)
                        Spacer()
                    }.padding(.vertical)
                    
                    HStack {
                        Stepper("Adults (\(adultsQuantity))", value: $adultsQuantity, in: 0...10)
                        Spacer()
                    }.padding(.vertical)
                    
                    HStack {
                        Stepper("Concession (\(concessionQuantity))", value: $concessionQuantity, in: 0...10)
                        Spacer()
                    }.padding(.vertical)
                }
                
                // Total Price
                Text("Total Price: $\(totalPrice, specifier: "%.2f")")
                    .font(.headline)
                    .padding()
                
                // Button to Select Seats
                Button(action: {
                    // Handle action to select seats
                }) {
                    Text("Select Seats")
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.blue)
                        .cornerRadius(10)
                }
                .padding()
                
                Spacer()
            }
            .padding()
            .navigationTitle("\(movie.title)")
        }
    }
}
