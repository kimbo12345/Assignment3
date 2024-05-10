//
//  MenuView.swift
//  assignment3
//
//  Created by Jerry Lo on 10/5/2024.
//


import SwiftUI

struct MenuView: View {
    var username: String
    
    struct Movie: Identifiable, Hashable {
        var id = UUID()
        var title: String
        var description: String
        var length: String
        var ticketPrice: Double
    }
    
    @State private var movies: [Movie] = [
        Movie(title: "Inception", description: "A thief who enters the dreams of others to steal their secrets from their subconscious.", length: "2h 28m", ticketPrice: 10.99),
        Movie(title: "The Shawshank Redemption", description: "Two imprisoned men bond over a number of years, finding solace and eventual redemption through acts of common decency.", length: "2h 22m", ticketPrice: 9.99),
        Movie(title: "The Dark Knight", description: "When the menace known as the Joker wreaks havoc and chaos on the people of Gotham, Batman must accept one of the greatest psychological and physical tests of his ability to fight injustice.", length: "2h 32m", ticketPrice: 12.99)
    ]
    
    @State private var selectedMovieID: UUID?
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Welcome, \(username)")
                    .font(.title)
                    .padding()
                
                ScrollView {
                    ForEach(movies) { movie in
                        VStack(alignment: .leading) {
                            Text(movie.title)
                                .font(.headline)
                            Text(movie.description)
                                .font(.subheadline)
                                .foregroundColor(.gray)
                            HStack {
                                Text("Length: \(movie.length)")
                                Spacer()
                                Text(String(format: "$%.2f", movie.ticketPrice))
                            }
                            .padding(.top, 5)
                            
                            NavigationLink(
                                destination: MovieView(username: username, movie: movie),
                                tag: movie.id,
                                selection: $selectedMovieID
                            ) {
                                EmptyView()
                            }
                            .buttonStyle(PlainButtonStyle()) // Remove NavigationLink default styling
                            .opacity(0) // Hide the navigation link
                            
                            HStack {
                                Spacer()
                                Button(action: {
                                    selectedMovieID = movie.id
                                }) {
                                    Text("View Info")
                                        .foregroundColor(.white)
                                        .padding(.vertical, 5)
                                        .padding(.horizontal, 10)
                                        .background(Color.blue)
                                        .cornerRadius(5)
                                }
                                Spacer()
                            }
                            .padding(.top, 5)
                        }
                        .padding(.vertical, 10)
                    }
                }
                
                Spacer()
            }
            .padding()
            .navigationTitle("Movies")
            
        }.navigationBarBackButtonHidden(true) // Hide the back button label
    }
}






struct TicketDetailsView: View {
    var username: String
    var movieTitle: String
    var ticketPrice: Double
    
    var body: some View {
        VStack {
            Text("Welcome, \(username)")
                .font(.title)
                .padding()
            
            Text("Movie: \(movieTitle)")
                .padding()
            
            Text("Ticket Price: $\(ticketPrice)")
                .padding()
            
            Spacer()
        }
        .navigationTitle("Ticket Details")
    }
}