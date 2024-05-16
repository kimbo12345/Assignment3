//
//  3.swift
//  assignment3
//
//  Created by Hyunmin Kim on 12/5/2024.
//

import SwiftUI

struct ConfirmationView: View {
    var username: String
    var movie: MenuView.Movie
    var kidsQuantity: Int
    var adultsQuantity: Int
    var concessionQuantity: Int
    var selectedSeats: [Int]
    var selectedTime: String
    
    var body: some View {
        VStack {
            Text("Reservation Confirmation").font(.headline)
            Text("Movie: \(movie.title)")
            Text("Time: \(selectedTime)")
            Text("Seats: \(selectedSeats.count)")
            Text("Total Price: $\(calculateTotalPrice())")
            Button("Complete Reservation") {
                print("Reservation Completed.")
            }
        }.padding()
    }
    
    func calculateTotalPrice() -> Double {
        let kidsPrice = Double(kidsQuantity) * 9.99
        let adultsPrice = Double(adultsQuantity) * 12.99
        let concessionPrice = Double(concessionQuantity) * 10.99
        let seatPrice = Double(selectedSeats.count) * 3.0
        return kidsPrice + adultsPrice + concessionPrice + seatPrice
    }
}
