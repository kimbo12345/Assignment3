//
//  TimeSelectionView.swift
//  assignment3
//
//  Created by Jerry Lo on 12/5/2024.
//

import SwiftUI
// info for time selection
struct TimeSelectionView: View {
    var username: String
    var movie: MenuView.Movie
    var kidsQuantity: Int
    var adultsQuantity: Int
    var concessionQuantity: Int
    let movieTimes: [String] = ["10:00 AM", "1:00 PM", "4:00 PM"] // Example movie times
    
    var body: some View {
        VStack {
            Text("Select Time")
                .font(.headline)
                .padding()
            
            VStack(spacing: 20) {
                ForEach(movieTimes, id: \.self) { time in
                    NavigationLink(destination: SeatSelectionView(
                        username: username,
                        movie: movie,
                        kidsQuantity: kidsQuantity,
                        adultsQuantity: adultsQuantity,
                        concessionQuantity: concessionQuantity,
                        selectedTime: time
                    )) {
                        Text(time)
                            .font(.subheadline)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                            .shadow(radius: 5)
                    }
                }
            }
            .padding(.horizontal)
            
            Spacer()
        }
        .padding()
        .navigationTitle("Movie Times")
        .navigationBarBackButtonHidden(true)
    }
}
