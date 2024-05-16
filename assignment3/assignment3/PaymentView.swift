//
//  2.swift
//  assignment3
//
//  Created by Hyunmin Kim on 12/5/2024.
//

import SwiftUI

struct PaymentView: View {
    var username: String
    var movie: MenuView.Movie
    var kidsQuantity: Int
    var adultsQuantity: Int
    var concessionQuantity: Int
    var selectedSeats: [Int]
    var selectedTime: String
    var totalPrice: Double

    @State private var cardNumber = ""
    @State private var expirationDate = ""
    @State private var cvv = ""

    var body: some View {
        VStack(spacing: 20) {
            Text("Enter Payment Information").font(.headline)
            Text("Total Price: $\(totalPrice, specifier: "%.2f")").font(.subheadline)
            TextField("Card Number", text: $cardNumber)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            TextField("Expiration Date", text: $expirationDate)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            TextField("CVV", text: $cvv)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            NavigationLink("Confirm Payment", destination: ConfirmationView(
                username: username,
                movie: movie,
                kidsQuantity: kidsQuantity,
                adultsQuantity: adultsQuantity,
                concessionQuantity: concessionQuantity,
                selectedSeats: selectedSeats,
                selectedTime: selectedTime
            ))
            Spacer()
        }.padding()
    }
}


