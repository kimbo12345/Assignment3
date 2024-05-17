//
//  MenuView.swift
//  assignment3
//
//  Created by Jerry Lo on 6/5/2024.
//

import SwiftUI

struct MenuView: View {
    var username: String

    
    struct Movie: Identifiable, Hashable {
        var id = UUID()
        var title: String
        var description: String
        var length: String
        var rating: String
        var imageName: String // add imageName property for movie poster
    }
    //Information for the movies
    @State private var movies: [Movie] = [ // list of movies, info and respective images
        Movie(title: "Parasite (2019)", description: "The struggling Kim family sees an opportunity when the son starts for the wealthy Park family. Soon, all of them find a way to work within the same household and start living a parasitic life.", length: "2h 28m", rating: "MA15+", imageName: "image1"),
        Movie(title: "Burning (2018)", description: "Lee Jong-Su, a young author, meets and falls for his childhood friend Shin Hae-mi. Later, she introduces him to Ben, a mysterious man who has a strange hobby, leading to chilling circumstances.", length: "2h 22m", rating: "MA15+", imageName: "image2"),
        Movie(title: "OldBoy (2003)", description: "A man, held captive for no apparent reason for years, is given a cell phone, money and expensive clothes and released. Unless he finds out the identity of his captor, an even worse fate awaits him.", length: "2h 12m", rating: "R18+", imageName: "image3")
    ]
    
    
    var body: some View {
        NavigationView {
            VStack {
                Text("CineBook")
                    .font(.headline)
                    .foregroundColor(.black)
                    .fontWeight(.bold)
                Text("Welcome, \(username)")
                    .font(.title)
                    .padding()
                    .navigationBarBackButtonHidden(true)
                ScrollView {
                    ForEach(movies) { movie in
                        NavigationLink(destination: MovieView(username: username, movie: movie)) {
                            VStack(alignment: .leading) {
                                HStack {
                                    
                                    Image(movie.imageName) // movie poster
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 150, height: 200)
                                    
                                    VStack(alignment: .leading) {
                                        Text(movie.title)
                                            .font(.headline)
                                            .foregroundColor(.black)
                                        
                                        Text(movie.description)
                                            .foregroundColor(.black)
                                            .foregroundColor(.gray)
                                        HStack {
                                            Text("\(movie.length)") // or duration
                                                .foregroundColor(.black)
                                            Spacer()
                                            Text("\(movie.rating)") // movie age rating
                                                .foregroundColor(.black)
                                        }
                                        .padding(.top, 5)
                                    }
                                }
                                .padding(.vertical, 10)
                                
                            }
                        }
                    }
                }
                
                Spacer()
                    .navigationBarBackButtonHidden(true)
            }
            .padding()
            .navigationTitle("CineBook")
            .navigationBarBackButtonHidden(true) // Hide the back button label
            .navigationBarHidden(true)
            BottomNavBar(username:username)
            
            .padding() // Add padding to the button
            .foregroundColor(.white) // Set text color to white
            .background(Color.blue) // Set background color to blue
            .cornerRadius(10) // Round the corners of the button
            .padding() // Add more padding for better spacing
        }.navigationBarBackButtonHidden(true)
    }
}


// ticket details
struct TicketDetailsView: View {
    var username: String
    var movieTitle: String
    var ticketPrice: Double
    
    var body: some View {
        VStack {
            Text("Welcome, \(username)") // gathered info from the NavView from ContentView
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
